#!/usr/bin/env bash

cd $HOME/bootleg

repo sync --force-sync

git clone https://github.com/retr0gr4d3/android_device_google_blueline device/google/blueline
git clone https://github.com/stebomurkn420/android_device_google_crosshatch device/google/crosshatch
git clone https://github.com/stebomurkn420/android_device_google_crosshatch-sepolicy device/google/crosshatch-sepolicy
git clone https://github.com/stebomurkn420/bluecross kernel/google/bluecross
git clone https://github.com/DirtyUnicorns/android_vendor_google vendor/google
git clone https://gitlab.com/shagbag913/android_vendor_pixelgapps vendor/pixelgapps
git clone https://github.com/LineageOS/android_hardware_qcom_audio hardware/qcom/audio
git clone https://github.com/stebomurkn420/android_hardware_qcom_sdm845_data_ipacfg-mgr hardware/qcom/sdm845/data/ipacfg-mgr

. build/envsetup.sh
lunch bootleg_blueline-userdebug
make clean
make bacon -j15
