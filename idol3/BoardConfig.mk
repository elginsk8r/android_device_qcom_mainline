include device/qcom/mainline/shared/soc/msm8916/PlatformConfig.mk

# Board Information
TARGET_BOOTLOADER_BOARD_NAME := idol3
TARGET_BOARD_PLATFORM := idol3
TARGET_SCREEN_DENSITY := 400

# Kernel/boot.img Configuration
BOARD_KERNEL_CMDLINE     += androidboot.hardware=idol3

# Kernel
TARGET_KERNEL_DTB := msm8939-alcatel-idol3.dtb
TARGET_KERNEL_MODULE_LIST += $(strip $(shell cat device/qcom/mainline/idol3/modules.load))

# Image Configuration
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2874146816
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12176530432