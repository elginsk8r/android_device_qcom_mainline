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

# setup dalvik vm configs
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Check vendor package version
# If you need to make changes to the vendor partition,
# please modify the source git project here:
#   https://staging-git.codelinaro.org/linaro/linaro-aosp/aosp-linaro-vendor-package
include device/linaro/dragonboard/vendor-package-ver.mk
ifneq (,$(wildcard $(LINARO_VENDOR_PATH)/db845c/$(EXPECTED_LINARO_VENDOR_VERSION)/version.mk))
  # Unfortunately inherit-product doesn't export build variables from the
  # called make file to the caller, so we have to include it directly here.
  include $(LINARO_VENDOR_PATH)/db845c/$(EXPECTED_LINARO_VENDOR_VERSION)/version.mk
  ifneq ($(TARGET_LINARO_VENDOR_VERSION), $(EXPECTED_LINARO_VENDOR_VERSION))
    $(warning TARGET_LINARO_VENDOR_VERSION ($(TARGET_LINARO_VENDOR_VERSION)) does not match exiting the build ($(EXPECTED_LINARO_VENDOR_VERSION)).)
    $(warning Please download new binaries here:)
    $(warning    $(VND_PKG_URL) )
    $(warning And extract in the ANDROID_TOP_DIR)
    # Would be good to error out here, but that causes other issues
  endif
else
  $(warning Missing Linaro Vendor Package!)
  $(warning Please download new binaries here:)
  $(warning    $(VND_PKG_URL) )
  $(warning And extract in the ANDROID_TOP_DIR)
  # Would be good to error out here, but that causes other issues
endif

# Dynamic partitions
PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

# Enable Virtual A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    product \
    system \
    system_ext \
    vendor

PRODUCT_COPY_FILES += \
    $(TARGET_KERNEL_DIR)/Image.gz:kernel \
    device/linaro/dragonboard/fstab.dynamic:$(TARGET_COPY_OUT_RAMDISK)/first_stage_ramdisk/fstab.$(TARGET_HARDWARE) \
    device/linaro/dragonboard/fstab.dynamic:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.$(TARGET_HARDWARE)

TARGET_HARDWARE := sm8450
TARGET_KERNEL_USE ?= mainline

include device/linaro/dragonboard/device-common.mk

PRODUCT_COPY_FILES += $(TARGET_KERNEL_DIR)/sm8450-qrd.dtb:dtb.img
