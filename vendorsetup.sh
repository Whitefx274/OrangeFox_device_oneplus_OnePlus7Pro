echo ""
# Clone/Fetch Upstream Device Dependencies
# Device Tree
#echo "Cloning OnePlus 7Pro Tree"
# add clang-proton to our path
#export PATH="$(gettop)/prebuilts/clang/host/linux-x86/clang-proton/bin:$PATH"

kernel_dir="kernel/oneplus/sm8150"
bootable_recov="bootable/recovery"

echo "Cloning kernel tree"
if [ -e "$kernel_dir" ]; then
    echo "Kernel exists. No need to download."
    echo ""
else
    # Download the ZIP file
    git clone --depth=1 https://github.com/nebrassy/android_kernel_oneplus_sm8150 -b android-12.1 kernel/oneplus/sm8150

    # Check if the download was successful
    if [ $? -eq 0 ]; then
        echo "Kernel Download successful."
        echo ""
    else
        echo "Kernel Download failed."
        echo ""
    fi
fi


echo "Cloning bootable/recovery"
if [ -e "$bootable_recov" ]; then
    echo "bootable/recovery exists. No need to download."
    echo ""
else
    # Download the bootable/recovery dir.
    git clone https://gitlab.com/whitefx274/ofox-bootable-recovery -b fox_12.1 bootable/recovery

    # Check if the download was successful
    if [ $? -eq 0 ]; then
        echo "bootable/recovery Download successful."
        echo ""
    else
        echo "bootable/recovery failed."
        echo ""
    fi
fi

# add clang-proton to our path
#export PATH="$(gettop)/prebuilts/clang/host/linux-x86/clang-proton/bin:$PATH"

export TARGET_ARCH="arm64-v8a"

# Some about us
export FOX_VERSION="R12.1"
export OF_MAINTAINER=WHITEFX274

#Fox config location
#export FOX_SETTINGS_ROOT_DIRECTORY="/data/recovery/"
#export FOX_USE_DATA_RECOVERY_FOR_SETTINGS="1"

# Build environment stuffs
export ALLOW_MISSING_DEPENDENCIES=true
export OF_DISABLE_MIUI_SPECIFIC_FEATURES="0"
#export FOX_VANILLA_BUILD="1"
export LC_ALL="C"
export TARGET_DEVICE_ALT="guacamole, guacamoleb, guacamolec, oneplus 7, OnePlus7Pro, OnePlus7T, OnePlus7"

# Use magisk boot for patching
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export FOX_USE_SPECIFIC_MAGISK_ZIP=/device/oneplus/guacamole/magisk/Magisk-v27.0.zip
export FOX_DELETE_MAGISK_ADDON=1

export OF_DONT_PATCH_ON_FRESH_INSTALLATION=1

# Skip mounting storage
export OF_SKIP_FBE_DECRYPTION="1"

# We have a/b partitions
export FOX_AB_DEVICE=1

# Screen specifications
export TW_MAX_BRIGHTNESS=1000
#export OF_HIDE_NOTCH=1
export OF_SCREEN_H=2340
export OF_STATUS_H=80
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48

# Device stuff
export TW_HAS_MTP=1
export OF_KEEP_FORCED_ENCRYPTION=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1

# OTA for custom ROMs
export OF_SUPPORT_ALL_PAYLOAD_OTA_UPDATES=1
export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1

# For some reason this is dumb and necessary
export FOX_BUGGED_AOSP_ARB_WORKAROUND="1601559499"

# -- Add settings for R12 --
#export FOX_ENABLE_APP_MANAGER="1"
#export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
export FOX_PATCH_VBMETA_FLAG=1
#export OF_FORCE_USE_RECOVERY_FSTAB=true
export OF_DEFAULT_KEYMASTER_VERSION=4.0
export OF_NO_SPLASH_CHANGE=1
export OF_ADVANCED_SECURITY=1
#export FOX_NO_SAMSUNG_SPECIAL=1
export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
export OF_QUICK_BACKUP_LIST="/boot;/data;/system_image;/vendor_image;"
# -- end R12 settings --


# Add some extras
export OF_USE_LEGACY_BATTERY_SERVICES=1
#export OF_LOOP_DEVICE_ERRORS_TO_LOG=1
#export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_ZIP_BINARY=1
export FOX_ASH_IS_BASH=1
export FOX_USE_BASH_SHELL=1
#export OF_USE_LZ4_COMPRESSION=1
export FOX_USE_NANO_EDITOR=1
#export OF_USE_GREEN_LED=0
