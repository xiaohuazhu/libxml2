#!/bin/sh

build_version=4
package_name=icu4c-android
version=62.1

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
  cd "$current_dir/src"
  tar xzf "$package_dir/$archive_name"
  if [ $? != 0 ]; then
    echo "Unable to decompress $archive_name"
    exit 1
  fi
  
  cd "$current_dir/src/icu"
  # patch -p1 < "$current_dir/icu-android-16.patch"
  
  if test ! -d "$current_dir/$package_name-$build_version/include/unicode" ; then
    mkdir -p "$current_dir/$package_name-$build_version"
    mkdir -p "$current_dir/$package_name-$build_version/include"
    public_headers="source/common/unicode source/i18n/unicode source/io/unicode"
    cd "$current_dir/src/icu"
    cp -R $public_headers "$current_dir/$package_name-$build_version/include"
  fi

  cp -R "$current_dir/build-android" "$current_dir/src/icu"
  cd "$current_dir/src/icu/build-android/jni"
  echo Building
  $ANDROID_NDK/ndk-build

  archs="x86_64 armeabi-v7a x86 arm64-v8a"
  for arch in $archs ; do
    TARGET_ARCH_ABI=$arch
    mkdir -p "$current_dir/$package_name-$build_version/libs/$TARGET_ARCH_ABI"
    cp "$current_dir/src/icu/build-android/obj/local/$TARGET_ARCH_ABI"/libicu4c.a "$current_dir/$package_name-$build_version/libs/$TARGET_ARCH_ABI"
  done
  rm -rf "$current_dir/src"
}

# Start building.
build

cd "$current_dir"
zip -qry "$package_name-$build_version.zip" "$package_name-$build_version"
rm -rf "$package_name-$build_version"
