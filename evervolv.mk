#
# Copyright (C) 2021 The Evervolv Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Build ty[e
$(call inherit-product, $(SRC_EVERVOLV_DIR)/config/common_full_tablet_wifionly.mk)

# Bootanimation
BOOT_ANIMATION_SIZE := xga

# Kernel
TARGET_NO_KERNEL_OVERRIDE := true

# VNDK
PRODUCT_PACKAGES += \
    evervolv_compatibility_matrix.xml
