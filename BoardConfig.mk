# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# Inherit from the proprietary version
-include vendor/huawei/ideos/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := msm7k

# ARMv6-compatible processor rev 2 (v6l)
TARGET_ARCH_VARIANT := armv6j
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_ABI := armeabi-v6j

TARGET_BOOTLOADER_BOARD_NAME := U8150

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false

BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true

BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_BLUETOOTH := true

BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/huawei/ideos/recovery_ui.c
BOARD_LDPI_RECOVERY := true

BOARD_GPS_LIBRARIES := libloc_api

TARGET_PREBUILT_KERNEL := device/huawei/ideos/prebuilt/kernel

BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_CMDLINE := mem=211M console=ttyMSM2,115200n8 androidboot.hardware=ideos
BOARD_KERNEL_PAGESIZE := 4096

## cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 00500000 00020000 "boot"
# mtd1: 00500000 00020000 "recovery"
# mtd2: 00140000 00020000 "misc"
# mtd3: 00060000 00020000 "splash"
# mtd4: 0aa00000 00020000 "system"
# mtd5: 05d00000 00020000 "cache"
# mtd6: 0a6a0000 00020000 "userdata"
# mtd7: 01400000 00020000 "cust"

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0aa00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0a6a0000

# (BOARD_KERNEL_PAGESIZE * 64)
BOARD_FLASH_BLOCK_SIZE := 262144

BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/firmware/fw_bcm4319.bin nvram_path=/system/etc/firmware/nvram.txt"
WIFI_DRIVER_MODULE_NAME := "bcm4319"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/bcm4319.ko"
WPA_SUPPLICANT_VERSION := VER_0_6_X
