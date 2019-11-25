#!/usr/bin/env bash

cd

sudo apt install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev openjdk-8-jdk libncurses5 repo

cd

mkdir ~/android/lineage

mkdir -p ~/bin

curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo

chmod a+x ~/bin/repo

cd $HOME/android/lineage

repo init -u https://github.com/LineageOS/android.git -b lineage-17.0

repo sync --current-branch --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j6

git clone https://github.com/LineageOS/android_device_google_blueline device/google/blueline
git clone https://github.com/LineageOS/android_device_google_crosshatch device/google/crosshatch
git clone https://android.googlesource.com/device/google/crosshatch-sepolicy device/google/crosshatch-sepolicy
git clone https://github.com/LineageOS/android_kernel_google_msm-4.9 kernel/google/msm-4.9
git clone https://github.com/themuppets/proprietary_vendor_google vendor/google
git clone https://gitlab.com/shagbag913/vendor_gapps vendor/gapps
git clone https://github.com/LineageOS/android_hardware_qcom_audio hardware/qcom/audio
git clone https://android.googlesource.com/platform/hardware/qcom/sdm845/data/ipacfg-mgr hardware/qcom/data/ipacfg-mgr hardware/qcom/sdm845/data/ipacfg-mgr

. build/envsetup.sh
lunch lineage_blueline-userdebug
make bacon -j15
