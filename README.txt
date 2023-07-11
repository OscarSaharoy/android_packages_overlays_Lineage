written by oscar saharoy mar 2023

add new font to lineage font settings menu:

	in this repo/on computer:
		create folder in ./fonts with the new font, copying existing folders structure and updating all the strings inside
		make sure java and android build tools are installed, check inside ./fonts/build-font-apk.sh to see what is needed
		run the ./fonts/build-font-apk.sh script to get the font overlay .apk in ./bin

	on android device:
		add font files to /system/product/fonts/ (.otf or .ttf) 
			adb push fontfiles/font.ttf /system/product/fonts/font.ttf
		add new section to /system/product/etc/fonts_customization.xml with the new font
			vim /system/product/etc/fonts_customization.xml
		copy ./bin/FontNewFontOverlay.apk to the android device
			adb push bin/FontNewFontOverlay.apk /system/product/overlay/FontNewFont/FontNewFontOverlay.apk 


steps:

adb root
adb remount
adb push fontfiles/font.ttf /system/product/fonts/font.ttf
vim /system/product/etc/fonts_customization.xml
adb push bin/FontNewFontOverlay.apk /system/product/overlay/FontNewFont/FontNewFontOverlay.apk
adb reboot
