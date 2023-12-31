#
# Copyright (C) 2020-2022 The CipherOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/realme/RMX2117

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Inherit Vendor Blobs
$(call inherit-product, vendor/realme/RMX2117/RMX2117-vendor.mk)
#$(call inherit-product, vendor/mainline_modules/config.mk)
# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
# RealmeParts
$(call inherit-product, packages/apps/RealmeParts/parts.mk)

PRODUCT_COPY_FILES += \
    packages/apps/RealmeParts/init/parts.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/parts.rc

# Init scripts
PRODUCT_PACKAGES += \
        parts.rc

# Boot Animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Dynamic Partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# The first api level, device has been commercially launched on.
PRODUCT_SHIPPING_API_LEVEL := 29

# Extra VNDK Versions
PRODUCT_EXTRA_VNDK_VERSIONS := 31

# Init
PRODUCT_PACKAGES += \
    init.mt6853.rc \
    fstab.mt6853

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.RMX2117

# Biometrics
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.RMX2117

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml
# Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6853:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6853

# System prop
-include $(DEVICE_PATH)/system_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Permissions
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml

# RRO-Overlays
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    WifiOverlay

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    SecureElement \
    Tag \
    Updater

# HIDL
PRODUCT_PACKAGES += \
    libhardware \
    libhidltransport \
    libhwbinder

# Bluetooth Audio (System-side HAL, sysbta)
PRODUCT_PACKAGES += \
    audio.sysbta.default \
    android.hardware.bluetooth.audio-service-system

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration.xml \
    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration_7_0.xml

# DRM
PRODUCT_PACKAGES += \
    libdrm

# KPOC
PRODUCT_PACKAGES += \
    libsuspend


# IMS
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

# MTK
PRODUCT_PACKAGES += \
    MtkInCallService

# DT2W
PRODUCT_PACKAGES += \
    DT2W-Service-RMX2117


# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl:64 \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service


# RealmeParts
#$(call inherit-product, packages/apps/RealmeParts/parts.mk)

#PRODUCT_COPY_FILES += \
#    packages/apps/RealmeParts/init/parts.rc:$(TARGET_OUT_ETC)/init/parts.rc
