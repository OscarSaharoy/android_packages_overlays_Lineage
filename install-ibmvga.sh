#!/usr/bin/env bash

adb remount
adb push fontfiles/MxPlus_IBM_VGA_8x16.ttf /system/product/fonts/ibmvga.ttf
adb push xmls/ibmvga_fonts_customization.xml /system/product/etc/fonts_customization.xml
adb push apks/FontIBMVGAOverlay.apk /system/product/overlay/FontIBMVGA/FontIBMVGAOverlay.apk
