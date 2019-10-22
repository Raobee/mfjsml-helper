
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := main.cpp

LOCAL_CXXFLAGS  += -std=c++11  -fPIC
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog
LOCAL_CFLAGS  += -std=c99
LOCAL_MODULE := com_helper_mfjsml_jni
LOCAL_MODULE_FILENAME := com_helper_mfjsml_jni
LOCAL_SHARED_LIBRARIES := mysql\libmysql.lib

NDK_APP_OUT := bin/obj
include $(BUILD_SHARED_LIBRARY)
