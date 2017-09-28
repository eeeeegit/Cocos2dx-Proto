LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := cocos2dcpp_shared

LOCAL_MODULE_FILENAME := libcocos2dcpp

FILE_LIST := hellocpp/main.cpp 
FILE_LIST += $(wildcard $(LOCAL_PATH)/../../../Common/Classes/*.cpp)
FILE_LIST += $(wildcard $(LOCAL_PATH)/../../../Common/Classes/Game/*cpp)
FILE_LIST += $(wildcard $(LOCAL_PATH)/../../../Common/Classes/ProtoFile/*.pb.cc)

LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%) 

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../../Common/Classes \
$(LOCAL_PATH)/../../../lib_external/android/libproto3/include


LOCAL_CFLAGS += -DGAME_XPJ

LOCAL_STATIC_LIBRARIES += cocos2dx_static
LOCAL_STATIC_LIBRARIES += protobuf_static
LOCAL_STATIC_LIBRARIES += cocosdenshion_static
LOCAL_STATIC_LIBRARIES += cocos_extension_static
LOCAL_STATIC_LIBRARIES += iconv

include $(BUILD_SHARED_LIBRARY)

$(call import-add-path,$(LOCAL_PATH)/../../../../)
$(call import-add-path,$(LOCAL_PATH)/../../../../cocos2dx/platform/third_party/android/prebuilt/libcurl)

$(call import-module,cocos2dx)
$(call import-module,cocos2dx/platform/third_party/android/prebuilt/libcurl)
$(call import-module,CocosDenshion/android)
$(call import-module,extensions)
$(call import-module,projects/lib_external/android/libiconv)
$(call import-module,projects/lib_external/android/libproto3)

