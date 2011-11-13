#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSu8150E-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Extract prebuilt libraries (from a CM7 running device) needed for the U8150

DEVICE=u8150

DIRS="
bin
lib/hw
etc
"

for DIR in $DIRS; do
	mkdir -p ../../../vendor/huawei/$DEVICE/proprietary/$DIR
done

adb pull /system/bin/akmd2 ../../../vendor/huawei/$DEVICE/proprietary/bin/akmd2
adb pull /system/bin/hci_qcomm_init ../../../vendor/huawei/$DEVICE/proprietary/bin/hci_qcomm_init
adb pull /system/bin/qmuxd ../../../vendor/huawei/$DEVICE/proprietary/bin/qmuxd
adb pull /system/bin/rild ../../../vendor/huawei/$DEVICE/proprietary/bin/rild

adb pull /system/etc/01_qc.cfg ../../../vendor/huawei/$DEVICE/proprietary/etc/01_qc.cfg
adb pull /system/etc/AudioFilterU8150.csv ../../../vendor/huawei/$DEVICE/proprietary/etc/AudioFilterU8150.csv
adb pull /system/etc/init.qcom.bt.sh ../../../vendor/huawei/$DEVICE/proprietary/etc/init.qcom.bt.sh
adb pull /system/etc/pvplayer.cfg ../../../vendor/huawei/$DEVICE/proprietary/etc/pvplayer.cfg

adb pull /system/lib/hw/gralloc.msm7k.so ../../../vendor/huawei/$DEVICE/proprietary/lib/hw/gralloc.msm7k.so
adb pull /system/lib/hw/sensors.default.so ../../../vendor/huawei/$DEVICE/proprietary/lib/hw/sensors.default.so

adb pull /system/lib/libaudioeq.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libaudioeq.so
adb pull /system/lib/libcamera.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libcamera.so
adb pull /system/lib/libcm.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libcm.so
adb pull /system/lib/libdiag.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libdiag.so
adb pull /system/lib/libdll.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libdll.so
adb pull /system/lib/libdsm.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libdsm.so
adb pull /system/lib/libdss.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libdss.so
adb pull /system/lib/libgsdi_exp.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libgsdi_exp.so
adb pull /system/lib/libgstk_exp.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libgstk_exp.so
adb pull /system/lib/libmm-adspsvc.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libmm-adspsvc.so
adb pull /system/lib/libmm-omxcore.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libmm-omxcore.so
adb pull /system/lib/libmmgsdilib.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libmmgsdilib.so
adb pull /system/lib/libmmipl.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libmmipl.so
adb pull /system/lib/libmmjpeg.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libmmjpeg.so
adb pull /system/lib/libmmprocess.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libmmprocess.so
adb pull /system/lib/libnv.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libnv.so
adb pull /system/lib/libOmxCore.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libOmxCore.so
adb pull /system/lib/libOmxH264Dec.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libOmxH264Dec.so
adb pull /system/lib/libOmxMpeg4Dec.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libOmxMpeg4Dec.so
adb pull /system/lib/libOmxVidEnc.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libOmxVidEnc.so
adb pull /system/lib/libOmxWmvDec.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libOmxWmvDec.so
adb pull /system/lib/liboncrpc.so ../../../vendor/huawei/$DEVICE/proprietary/lib/liboncrpc.so
adb pull /system/lib/libpbmlib.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libpbmlib.so
adb pull /system/lib/libqcamera.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libqcamera.so
adb pull /system/lib/libqmi.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libqmi.so
adb pull /system/lib/libqueue.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libqueue.so
adb pull /system/lib/libril-qc-1.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libril-qc-1.so
adb pull /system/lib/libril-qcril-hook-oem.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libril-qcril-hook-oem.so
adb pull /system/lib/libwms.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libwms.so
adb pull /system/lib/libwmsts.so ../../../vendor/huawei/$DEVICE/proprietary/lib/libwmsts.so

chmod 755 ../../../vendor/huawei/u8150/proprietary/bin/* 

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/huawei/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The AndroidOpen Source Project
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

# This file is generated by device/huawei/__DEVICE__/extract-files.sh - DO NOT EDIT

# All the blobs necessary for U8150
PRODUCT_COPY_FILES += \\
    vendor/huawei/__DEVICE__/proprietary/bin/akmd2:system/bin/akmd2 \\
    vendor/huawei/__DEVICE__/proprietary/bin/hci_qcomm_init:system/bin/hci_qcomm_init \\
    vendor/huawei/__DEVICE__/proprietary/bin/qmuxd:system/bin/qmuxd \\
    vendor/huawei/__DEVICE__/proprietary/bin/rild:system/bin/rild

PRODUCT_COPY_FILES += \\
    vendor/huawei/__DEVICE__/proprietary/etc/01_qc.cfg:system/etc/01_qc.cfg \\
    vendor/huawei/__DEVICE__/proprietary/etc/AudioFilterU8150.csv:system/etc/AudioFilterU8150.csv \\
    vendor/huawei/__DEVICE__/proprietary/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \\
    vendor/huawei/__DEVICE__/proprietary/etc/pvplayer.cfg:system/etc/pvplayer.cfg

PRODUCT_COPY_FILES += \\
    vendor/huawei/__DEVICE__/proprietary/lib/hw/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so

PRODUCT_COPY_FILES += \\
    vendor/huawei/__DEVICE__/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libcamera.so:system/lib/libcamera.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libcamera.so:obj/lib/libcamera.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libcm.so:system/lib/libcm.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libdiag.so:system/lib/libdiag.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libdll.so:system/lib/libdll.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libdsm.so:system/lib/libdsm.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libdss.so:system/lib/libdss.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libmmprocess.so:system/lib/libmmprocess.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libnv.so:system/lib/libnv.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libOmxCore.so:system/lib/libOmxCore.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libqcamera.so:system/lib/libqcamera.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libqmi.so:system/lib/libqmi.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libqueue.so:system/lib/libqueue.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libwms.so:system/lib/libwms.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libwmsts.so:system/lib/libwmsts.so

EOF

./setup-makefiles.sh
