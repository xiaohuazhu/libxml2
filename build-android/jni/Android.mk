LOCAL_PATH := $(call my-dir)

src_files := SAX.c entities.c encoding.c error.c \
        parserInternals.c parser.c tree.c hash.c list.c xmlIO.c \
        xmlmemory.c uri.c valid.c xlink.c HTMLparser.c HTMLtree.c \
        debugXML.c xpath.c xpointer.c xinclude.c \
        DOCBparser.c catalog.c globals.c threads.c c14n.c xmlstring.c \
        buf.c xmlregexp.c xmlschemas.c xmlschemastypes.c xmlunicode.c \
        xmlreader.c relaxng.c dict.c SAX2.c \
        xmlwriter.c legacy.c chvalid.c pattern.c xmlsave.c xmlmodule.c \
        schematron.c

include $(CLEAR_VARS)

ifeq ($(ICU4C_PATH),)
$(error ICU4C_PATH must be set)
endif

NDK_TOOLCHAIN_VERSION := clang
LOCAL_MODULE := libxml2
LOCAL_CFLAGS += -DLIBXML_THREAD_ENABLED=1
src_dir := $(LOCAL_PATH)/../..
LOCAL_SRC_FILES := $(addprefix $(src_dir)/, $(src_files))
LOCAL_C_INCLUDES += $(src_dir)/build-android/include $(src_dir)/include \
  $(ICU4C_PATH)/include

include $(BUILD_STATIC_LIBRARY)
