#
# This file should set PRODUCT_MAKEFILES to a list of product makefiles
# to expose to the build system.  LOCAL_DIR will already be set to
# the directory containing this file.
#
# This file may not rely on the value of any variable other than
# LOCAL_DIR; do not use any conditionals, and do not look up the
# value of any variable that isn't set in this file or in a file that
# it includes.
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/db845c.mk \
    $(LOCAL_DIR)/db845c_mini.mk \
    $(LOCAL_DIR)/msm8916.mk \
    $(LOCAL_DIR)/msm8916_mini.mk \
    $(LOCAL_DIR)/rb5.mk \
    $(LOCAL_DIR)/rb5_mini.mk \
    $(LOCAL_DIR)/sm8450_mini.mk \

COMMON_LUNCH_CHOICES := \
    db845c-userdebug \
    msm8916-userdebug \
    rb5-userdebug

ifneq ($(wildcard $(SRC_EVERVOLV_DIR)/config/common_full_tablet_wifionly.mk),)

PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/ev_db845c.mk \
    $(LOCAL_DIR)/ev_db845c_mini.mk \
    $(LOCAL_DIR)/ev_msm8916.mk \
    $(LOCAL_DIR)/ev_msm8916_mini.mk \
    $(LOCAL_DIR)/ev_rb5.mk \
    $(LOCAL_DIR)/ev_rb5_mini.mk \
    $(LOCAL_DIR)/ev_sm8450_mini.mk \

COMMON_LUNCH_CHOICES += \
    ev_db845c-userdebug \
    ev_msm8916-userdebug \
    ev_rb5-userdebug

endif

