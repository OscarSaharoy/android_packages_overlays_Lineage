#!/bin/bash

folderName=$1
if [ -z "$folderName" ]; then
	echo "error: provide folderName eg. FontSpaceMonoOverlay as 1st arg"
	exit
fi

keypass=$2
if [ -z "$keypass" ]; then
	echo "error: provide keypass as 2nd arg"
	exit
fi


rm -v -f -r ../obj
rm -v -f -r ../bin
rm -v -f -r ../key
mkdir ../obj
mkdir ../bin
mkdir ../key

aapt package -v -f -m -S ./$folderName/res/ -M ./$folderName/AndroidManifest.xml -I "$HOME/tools/android-commandline-tools/platforms/android-23/android.jar" # you may need to replace "/usr/lib/android-sdk/platforms/android-23/android.jar" here and in the subsequent commands
aapt package -f -M ./$folderName/AndroidManifest.xml -S ./$folderName/res/ -I "$HOME/tools/android-commandline-tools/platforms/android-23/android.jar" -F ../bin/$folderName.unsigned.apk ../bin # it is important that the ./bin/ directory does not contain any files except for classes.dex when this command starts
keytool -genkeypair -validity 10000 -dname "CN=OscarSaharoy, OU=OscarSaharoy, O=OscarSaharoy, C=UK" -keystore ../key/mykey.keystore -storepass $keypass -keypass $keypass -alias $folderName"Key" -keyalg RSA
jarsigner -keystore ../key/mykey.keystore -storepass $keypass -keypass $keypass -signedjar ../bin/$folderName.signed.apk ../bin/$folderName.unsigned.apk $folderName"Key"
zipalign -f 4 ../bin/$folderName.signed.apk ../bin/$folderName.apk
