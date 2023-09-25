BOARD_BUILD_AOSPEXT_DBUS := true
BOARD_DBUS_SRC_DIR := glodroid/vendor/dbus

BOARD_BUILD_AOSPEXT_GLIB := true
BOARD_GLIB_SRC_DIR := glodroid/vendor/glib

BOARD_BUILD_AOSPEXT_LIBGUDEV := true
BOARD_LIBGUDEV_SRC_DIR := glodroid/vendor/libgudev

BOARD_BUILD_AOSPEXT_LIBMBIM := true
BOARD_LIBMBIM_SRC_DIR := glodroid/vendor/libmbim

BOARD_BUILD_AOSPEXT_LIBQRTR := true
BOARD_LIBQRTR_SRC_DIR := glodroid/vendor/libqrtr

BOARD_BUILD_AOSPEXT_LIBQMI := true
BOARD_LIBQMI_SRC_DIR := glodroid/vendor/libqmi

RUST_BIN_DIR := glodroid/compilers/rust/1.65.0/bin

BOARD_BUILD_AOSPEXT_MMRADIO := true
BOARD_MMRADIO_SRC_DIR := glodroid/vendor/mm-radio

BOARD_BUILD_AOSPEXT_MODEMMANAGER := true
BOARD_MODEMMANAGER_SRC_DIR := glodroid/vendor/modem_manager
BOARD_MODEMMANAGER_PATCHES_DIRS := glodroid/configuration/common/modem/patches-modemmanager

DEVICE_MANIFEST_FILE += device/qcom/mainline/shared/modem_manager/android.hardware.radio.xml
