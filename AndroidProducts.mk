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
    axolotl:$(LOCAL_DIR)/axolotl/axolotl.mk \
    beryllium:$(LOCAL_DIR)/beryllium/beryllium.mk \
    enchilada:$(LOCAL_DIR)/enchilada/enchilada.mk \
    idol3:$(LOCAL_DIR)/idol3/idol3.mk \
    idol347:$(LOCAL_DIR)/idol347/idol347.mk

COMMON_LUNCH_CHOICES := \
    axolotl-userdebug \
    beryllium-userdebug \
    enchilada-userdebug \
    idol3-userdebug \
    idol347-userdebug
