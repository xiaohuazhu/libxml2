## Build instruction for Android ##

```
$ cd build-android/jni
$ export ANDROID_NDK=/path/to/android-ndk
$ $ANDROID_NDK/ndk-build TARGET_PLATFORM=android-21 ICU_SOURCE_PATH=/path/to/icu
```

The path to ICU must be the root content of the sources of ICU and not the "source" sub-directory.
