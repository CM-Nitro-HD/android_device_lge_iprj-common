$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_TAGS += dalvik.gc.type-precise
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/iprj-common/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/config/media_codecs.xml:system/etc/media_codecs.xml

$(call inherit-product, build/target/product/full.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.iprj.rc:root/init.iprj.rc \
    $(LOCAL_PATH)/ueventd.iprj.rc:root/ueventd.iprj.rc \
    $(LOCAL_PATH)/fstab.iprj:root/fstab.iprj \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.iprj.usb.rc:root/init.iprj.usb.rc \
    $(LOCAL_PATH)/prebuilt/boot_logo_00000.rle:root/bootimages/boot_logo_00000.rle \
    $(LOCAL_PATH)/prebuilt/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/prebuilt/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/prebuilt/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
    $(LOCAL_PATH)/prebuilt/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
    $(LOCAL_PATH)/prebuilt/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

## Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/config/atcmd_virtual_kbd.kl:system/usr/keylayout/atcmd_virtual_kbd.kl \
    $(LOCAL_PATH)/config/ffa-keypad_qwerty.kl:system/usr/keylayout/ffa-keypad_qwerty.kl \
    $(LOCAL_PATH)/config/i_atnt-keypad.kl:system/usr/keylayout/i_atnt-keypad.kl \
    $(LOCAL_PATH)/config/pmic8058_pwrkey.kl:system/usr/keylayout/pmic8058_pwrkey.kl \
    $(LOCAL_PATH)/config/synaptics_ts.kl:system/usr/keylayout/touch_dev.kl \
    $(LOCAL_PATH)/config/synaptics_ts.idc:system/usr/idc/touch_dev.idc \
    $(LOCAL_PATH)/config/thermald.conf:system/etc/thermald.conf \
    $(LOCAL_PATH)/config/hosts:system/etc/hosts

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf 
# Permission files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# HW HALS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/audio_policy.conf:system/vendor/etc/audio_policy.conf

PRODUCT_PACKAGES += \
    hdmid \
    libgenlock \
    libmemalloc \
    liboverlay \
    gralloc.msm8660 \
    hwcomposer.msm8660 \
    copybit.msm8660 \
    lights.iprj \
    gps.iprj \
    audio.primary.iprj \
    audio_policy.msm8660 \
    audio_policy.conf \
    audio.a2dp.default \
    power.iprj \
    com.android.future.usb.accessory

# OMX
#
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libdivxdrmdecrypt \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libmm-omxcore \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libdashplayer

PRODUCT_PACKAGES += \
    hwaddrs \
    brcm_patchram_plus

PRODUCT_PACKAGES += \
    NitroParts \

# Charger mode
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Common properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320 \
    mobiledata.interfaces=rmnet_sdio0,rmnet_sdio1 \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    ro.vendor.extension_library=/system/lib/libqc-opt.so \
    DEVICE_PROVISIONED=1 \
    ro.telephony.ril_class=LGEQualcommUiccRIL \
    ro.telephony.ril.v3=qcomuiccstack \
    wifi.interface=wlan0 \
    debug.sf.hw=1 \
    debug.composition.type=c2d \
    debug.egl.recordable.rgba8888=1 \
    persist.sys.usb.config=mtp,adb \
    ro.opengles.version=131072 \
    com.qc.hardware=true \
    ro.hdmi.enable=true \
    ro.bt.bdaddr_path=/data/misc/bd_addr \
    ro.product.camera=lgp930 \
    ro.ril.shutdown=true \
    debug.mdpcomp.maxlayer=3 \
    debug.mdpcomp.logs=0

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    persist.sys.usb.config=mtp

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_MANUFACTURER := LGE
PRODUCT_BRAND := lge
