#!/usr/bin/env bash

cd

sudo apt install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev libncurses5 git repo openjdk-8-jdk adb fastboot

cd $HOME/bliss

repo sync --current-branch --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune

rm -rf device/google/blueline
rm -rf device/google/crosshatch-kernel
rm -rf device/google/crosshatch
rm -rf device/google/crosshatch-sepolicy
rm -rf hardware/qcom/sdm710
rm -rf hardware/qcom/sdm845/display
rm -rf kernel/google/crosshatch
rm -rf vendor/google
rm -rf vendor/images
rm -rf vendor/gapps

git clone https://github.com/retr0gr4d3/device_google_crosshatch -b bliss device/google/crosshatch
git clone https://android.googlesource.com/device/sample device/sample
git clone https://github.com/themuppets/proprietary_vendor_google vendor/google
git clone https://github.com/lineageos/android_kernel_google_msm-4.9 -b lineage-17.1 kernel/google/msm-4.9
git clone https://gitlab.com/shagbag913/vendor_gapps -b ten vendor/gapps
git clone https://github.com/LineageOS/android_hardware_qcom_sdm845_display -b lineage-17.1 hardware/qcom/sdm845/display

. build/envsetup.sh

lunch bliss_blueline-userdebug

make blissify |& tee /tmp/build.log

lunch bliss_crosshatch-userdebug

make blissify |& tee /tmp/build.log
