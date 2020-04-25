ifndef TARGET_KERNEL_USE
TARGET_KERNEL_USE := 5.4
endif
DB845C_KERNEL_DIR := device/linaro/dragonboard-kernel/android-$(TARGET_KERNEL_USE)

# Inherit the full_base and device configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/linaro/dragonboard/db845c/device.mk)
$(call inherit-product, device/linaro/dragonboard/device-common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Product overrides
PRODUCT_NAME := db845c
PRODUCT_DEVICE := db845c
PRODUCT_BRAND := Android

ifndef DB845C_USES_GKI
DB845C_USES_GKI := true
endif

ifeq ($(DB845C_USES_GKI), true)
BOARD_GENERIC_RAMDISK_KERNEL_MODULES := $(wildcard $(DB845C_KERNEL_DIR)/*.ko)
endif