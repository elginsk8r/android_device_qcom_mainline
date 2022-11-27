#
# Copyright (C) 2011 The Android Open-Source Project
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

include $(LOCAL_PATH)/../vendor-package-ver.mk
ifeq ($(TARGET_USES_BOOT_HDR_V3), true)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
else
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
endif

# Build generic Audio HAL
PRODUCT_PACKAGES := audio.primary.db845c

# BootControl HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

# Install scripts to set vendor.* properties
PRODUCT_COPY_FILES += \
    device/linaro/dragonboard/qcom/set_hw.sh:$(TARGET_COPY_OUT_VENDOR)/bin/set_hw.sh \
    device/linaro/dragonboard/qcom/set_udc.sh:$(TARGET_COPY_OUT_VENDOR)/bin/set_udc.sh

# Install scripts to set Ethernet MAC address
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/eth_mac_addr.rc:/system/etc/init/eth_mac_addr.rc \
    $(LOCAL_PATH)/eth_mac_addr.sh:/system/bin/eth_mac_addr.sh

PRODUCT_VENDOR_PROPERTIES += ro.soc.manufacturer=Qualcomm
PRODUCT_VENDOR_PROPERTIES += ro.soc.model=SDM845

PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=160

# Copy firmware files
$(call inherit-product-if-exists, vendor/linaro/db845c/$(EXPECTED_LINARO_VENDOR_VERSION)/device.mk)
$(call inherit-product-if-exists, vendor/linaro/rb5/$(EXPECTED_LINARO_VENDOR_VERSION)/device.mk)

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

PRODUCT_SOONG_NAMESPACES += \
    vendor/linaro/db845c/$(EXPECTED_LINARO_VENDOR_VERSION)

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

TARGET_HARDWARE := db845c
TARGET_KERNEL_USE ?= 5.15

include device/linaro/dragonboard/device-common.mk
