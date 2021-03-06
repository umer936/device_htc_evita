$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/evita/evita-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/evita/overlay

LOCAL_PATH := device/htc/evita
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernAl
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/evita/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/evita/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/evita/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/evita/recovery/sbin/power_test:recovery/root/sbin/power_test \
    device/htc/evita/recovery/sbin/am:recovery/root/sbin/am \
    device/htc/evita/recovery/sbin/app_process:recovery/root/sbin/app_process \
    device/htc/evita/recovery/sbin/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := evita
