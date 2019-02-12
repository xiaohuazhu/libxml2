#!/bin/sh

build_version=4
icu4c_build_version=4
package_name=libxml2-android

current_dir="`pwd`"

if test "x$ANDROID_NDK" = x ; then
  echo should set ANDROID_NDK before running this script.
  exit 1
fi

if test ! -f "$current_dir/dependencies/icu4c/icu4c-android-$icu4c_build_version.zip" ; then
  echo Building icu4c first
  cd "$current_dir/dependencies/icu4c"
  ./build.sh
fi

function build {
  rm -rf "$current_dir/obj"
  
  cd "$current_dir/jni"
  echo Building
  $ANDROID_NDK/ndk-build \
    ICU4C_PATH="$current_dir/third-party/icu4c-android-$icu4c_build_version"

  archs="x86_64 armeabi-v7a x86 arm64-v8a"
  for arch in $archs ; do
    TARGET_ARCH_ABI=$arch
    mkdir -p "$current_dir/$package_name-$build_version/libs/$TARGET_ARCH_ABI"
    cp "$current_dir/obj/local/$TARGET_ARCH_ABI/libxml2.a" "$current_dir/$package_name-$build_version/libs/$TARGET_ARCH_ABI"
  done
  rm -rf "$current_dir/obj"
}

mkdir -p "$current_dir/third-party"
cd "$current_dir/third-party"
unzip -qo "$current_dir/dependencies/icu4c/icu4c-android-$icu4c_build_version.zip"

# Copy public headers to include
mkdir -p "$current_dir/$package_name-$build_version/include"
cp -r "$current_dir/../include/libxml" "$current_dir/$package_name-$build_version/include"
cp "$current_dir/include/libxml/xmlversion.h" "$current_dir/$package_name-$build_version/include/libxml"

# Start building.
build

rm -rf "$current_dir/third-party"
cd "$current_dir"
zip -qry "$package_name-$build_version.zip" "$package_name-$build_version"
rm -rf "$package_name-$build_version"
