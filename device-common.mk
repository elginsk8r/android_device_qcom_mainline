#
# Copyright (C) 2022 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_KERNEL_DIR ?= device/linaro/dragonboard-kernel/android-$(TARGET_KERNEL_USE)

TARGET_USES_GKI ?= true

ifeq ($(TARGET_USES_GKI), true)
  TARGET_MODS := $(wildcard $(TARGET_KERNEL_DIR)/*.ko)
  ifneq ($(TARGET_MODS),)
    BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(TARGET_MODS)
  endif
endif

PRODUCT_SHIPPING_API_LEVEL := 31

PRODUCT_SOONG_NAMESPACES += \
    device/linaro/dragonboard \
    vendor/linaro/linux-firmware/$(EXPECTED_LINARO_VENDOR_VERSION)

PRODUCT_COPY_FILES += \
    device/linaro/dragonboard/init.common.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.$(TARGET_HARDWARE).rc \
    device/linaro/dragonboard/init.common.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.$(TARGET_HARDWARE).usb.rc \
    device/linaro/dragonboard/common.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/$(TARGET_HARDWARE).kl
