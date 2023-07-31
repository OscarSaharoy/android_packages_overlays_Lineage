#!/usr/bin/env bash

adb remount
adb push fontfiles/unifont-15.0.06.otf /system/product/fonts/unifont.otf
adb push xmls/unifont_fonts_customization.xml /system/product/etc/fonts_customization.xml
adb push apks/FontUnifontOverlay.apk /system/product/overlay/FontUnifont/FontUnifontOverlay.apk
