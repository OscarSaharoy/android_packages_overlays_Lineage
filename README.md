
## How to add a new font to lineage font settings menu:

### in this repo/on computer:

create folder in `./fonts` with the new font, copying existing folders structure and updating all the strings inside

make sure java and android build tools are installed, check inside `./fonts/build-font-apk.sh` to see what is needed

run the `./fonts/build-font-apk.sh` script to get the font overlay `.apk` in `./bin`

### on android device:

Add font files to `/system/product/fonts/` (.otf or .ttf):

```adb push fontfiles/font.ttf /system/product/fonts/font.ttf```

Add new section to `/system/product/etc/fonts_customization.xml` with the new font:
```
adb root
adb shell
# vim /system/product/etc/fonts_customization.xml
```

Copy `./bin/FontNewFontOverlay.apk` to the android device:

```adb push bin/FontNewFontOverlay.apk /system/product/overlay/FontNewFont/FontNewFontOverlay.apk```

### `install-unifont.sh`

The `install-unifont.sh` script automates the steps after building the unifont apk, so that it can be used to quickly re-add
unifont after a system update.

