LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

GIT_VERSION := " $(shell git rev-parse --short HEAD || echo unknown)"
ifneq ($(GIT_VERSION)," unknown")
	LOCAL_CXXFLAGS += -DGIT_VERSION=\"$(GIT_VERSION)\"
endif

ifeq ($(TARGET_ARCH),arm)
LOCAL_CFLAGS += -DANDROID_ARM
LOCAL_ARM_MODE := arm
endif

ifeq ($(TARGET_ARCH),x86)
LOCAL_CFLAGS +=  -DANDROID_X86
endif

ifeq ($(TARGET_ARCH),mips)
LOCAL_CFLAGS += -DANDROID_MIPS
endif

CORE_DIR := ..

LOCAL_MODULE    := libretro

LOCAL_DISABLE_FORMAT_STRING_CHECKS := true

SOURCES_C :=

include ../Makefile.common

LOCAL_SRC_FILES    +=  $(SOURCES_C)

LOCAL_CFLAGS += -DANDROID -DRETRO -DAND -D__LIBRETRO__ -DLSB_FIRST -DALIGN_DWORD

LOCAL_CFLAGS += -DCPUEMU_0 -DCPUEMU_11 -DCPUEMU_12 -DCPUEMU_20 -DCPUEMU_21 -DCPUEMU_22  -DFPUEMU -DUNALIGNED_PROFITABLE -DAMAX -DAGA -DAUTOCONFIG -DFILESYS -DSUPPORT_THREADS  -DFDI2RAW -DDEBUGGER -DSAVESTATE -DENFORCER -DACTION_REPLAY -DXARCADE -DCPUEMU_31 -DCPUEMU_32  -DCPUEMU_33 -DMMUEMU -DFULLMMU

LOCAL_CFLAGS += $(CFLAGS)

LOCAL_CFLAGS += $(INCFLAGS) -I./include

LOCAL_CFLAGS += -std=c99

LOCAL_LDLIBS := -lz

include $(BUILD_SHARED_LIBRARY)
