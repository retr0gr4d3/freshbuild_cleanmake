#!/usr/bin/env bash

cd $HOME/bootleg
repo sync --force-sync

cd device/google
rm -rf blueline
rm -rf crosshatch
rm -rf crosshatch-sepolicy
git clone https://github.com/retr0gr4d3/android_device_google_blueline blueline 
git clone https://github.com/stebomurkn420/android_device_google_crosshatch crosshatch
git clone https://github.com/stebomurkn420/android_device_google_crosshatch-sepolicy crosshatch-sepolicy

cd $HOME/bootleg/kernel/google
rm -rf bluecross
git clone https://github.com/stebomurkn420/bluecross bluecross

cd $HOME/bootleg/vendor
rm -rf google
rm -rf pixelgapps
git clone https://github.com/DirtyUnicorns/android_vendor_google google
git clone https://gitlab.com/shagbag913/android_vendor_pixelgapps pixelgapps

cd $HOME/bootleg/hardware/qcom
rm -rf audio
git clone https://github.com/LineageOS/android_hardware_qcom_audio audio

cd sdm845/data
rm -rf ipacfg-mgr
git clone https://github.com/stebomurkn420/android_hardware_qcom_sdm845_data_ipacfg-mgr ipacfg-mgr

cd $HOME/bootleg
. build/envsetup.sh
lunch bootleg_blueline-userdebug
make clean
make bacon -j15
