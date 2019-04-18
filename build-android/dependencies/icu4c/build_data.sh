#!/bin/sh

build_version=4
package_name=icu4cd-android
version=62.1
android_platform=android-21

underscore_version="`echo $version|sed -e 's/\./_/'`"
archive_name=icu4c-$underscore_version-src.tgz
url=http://download.icu-project.org/files/icu4c/$version/$archive_name

if test "x$ANDROID_NDK" = x ; then
  echo should set ANDROID_NDK before running this script.
  exit 1
fi

current_dir="`pwd`"
package_dir="$current_dir/packages"

if test ! -f "$package_dir/$archive_name"; then
  mkdir -p "$package_dir"
  cd "$package_dir"
  curl -L -O $url
  cd ..
fi

function build {
  rm -rf "$current_dir/src"
  
  mkdir -p "$current_dir/src"
  mkdir -p "$current_dir/src/build-mac"
  mkdir -p "$current_dir/src/build-android"
  cd "$current_dir/src"
  tar xzf "$package_dir/$archive_name"
  if [ $? != 0 ]; then
    echo "Unable to decompress $archive_name"
    exit 1
  fi
  
  cd "$current_dir/src/build-mac"
  sh "$current_dir/src/icu/source/runConfigureICU" MacOSX
  gnumake

  cd "$current_dir/src/build-android"

  #Configure toolchain
  TOOLCHAIN="$current_dir/src/toolchain_tmp"
  $NDK_ROOT/build/tools/make-standalone-toolchain.sh --arch=arm64 --platform=$android_platform --install-dir=$TOOLCHAIN

  # Setup cross-compile environment
  export SYSROOT=$TOOLCHAIN/sysroot
  export ARCH=armv8-a
  export CC=$TOOLCHAIN/bin/aarch64-linux-android-clang
  export CXX=$TOOLCHAIN/bin/aarch64-linux-android-clang++
  export AR=$TOOLCHAIN/bin/aarch64-linux-android-ar
  export AS=$TOOLCHAIN/bin/aarch64-linux-android-as
  export LD=$TOOLCHAIN/bin/aarch64-linux-android-ld
  export RANLIB=$TOOLCHAIN/bin/aarch64-linux-android-ranlib
  export NM=$TOOLCHAIN/bin/aarch64-linux-android-nm
  export STRIP=$TOOLCHAIN/bin/aarch64-linux-android-strip
  export CHOST=$TOOLCHAIN/bin/aarch64-linux-android

  #Configure icu
  saved_path="$PATH"
  export PATH=$TOOLCHAIN/bin:$PATH
  export CFLAGS="--sysroot=$SYSROOT -fPIC -march=$ARCH"
  export CPPFLAGS="$CFLAGS -I$TOOLCHAIN/include -DANDROID"
  export LIBS=""
  export LDFLAGS="-march=$ARCH"
  echo Building
  sh "$current_dir/src/icu/source/configure" --host=aarch64-linux-android --with-cross-build="$current_dir/src/build-mac" --with-data-packaging=archive
  gnumake

  export PATH="$saved_path"

  mkdir -p "$current_dir/$package_name-$build_version"
  cp "$current_dir/src/build-android/data/out/icudt62l.dat" "$current_dir/$package_name-$build_version"
  rm -rf "$current_dir/src"
}

# start building.
build

cd "$current_dir"
zip -qry "$package_name-$build_version.zip" "$package_name-$build_version"
rm -rf "$package_name-$build_version"
