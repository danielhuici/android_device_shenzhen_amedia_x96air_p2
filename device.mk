#
# Copyright (C) 2021-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## Bluetooth
PRODUCT_PACKAGES += \
    X96AirP2BluetoothOverlay

## Bluetooth firmware
include kernel/amlogic/kernel-modules/dhd-driver/firmware/bluetooth/bluetooth.mk

## Factory
PRODUCT_HOST_PACKAGES += \
    aml_image_packer

## Init-Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init-files/init.amlogic.wifi_buildin.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.wifi_buildin.rc \
    $(LOCAL_PATH)/init-files/remote_controllers.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/remote_controllers.rc \
    $(LOCAL_PATH)/init-files/openvfd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/openvfd.rc \
    $(LOCAL_PATH)/configs/keylayout/Vendor_0001_Product_0001.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_0001_Product_0001.kl \
    $(LOCAL_PATH)/configs/remote/remote-0xfe01.tab:$(TARGET_COPY_OUT_VENDOR)/etc/remote-0xfe01.tab \
    $(LOCAL_PATH)/configs/remote/remote-0x7f80.tab:$(TARGET_COPY_OUT_VENDOR)/etc/remote-0x7f80.tab \
    $(LOCAL_PATH)/init-files/vfd_av_indicator.sh:$(TARGET_COPY_OUT_VENDOR)/bin/vfd_av_indicator.sh \
    $(LOCAL_PATH)/blobs/libbt-vendor.so:$(TARGET_COPY_OUT_VENDOR)/lib/libbt-vendor.so


## TEE
TARGET_HAS_TEE := false

## Wi-Fi firmware
include kernel/amlogic/kernel-modules/dhd-driver/firmware/wifi/wifi.mk

## VFD
PRODUCT_PACKAGES += \
    OpenVFDService

## Inherit from the common tree product makefile
$(call inherit-product, device/amlogic/g12-common/g12.mk)
