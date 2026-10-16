#!/usr/bin/env bash
set -e
RES=android/app/src/main/res
MAN=android/app/src/main/AndroidManifest.xml
# camera permission
grep -q 'android.permission.CAMERA' $MAN || sed -i 's#<application#<uses-permission android:name="android.permission.CAMERA" />\n    <uses-feature android:name="android.hardware.camera" android:required="false" />\n    <application#' $MAN
# launcher icons (remove adaptive xml so PNGs are used)
rm -rf $RES/mipmap-anydpi-v26
put(){ for n in ic_launcher ic_launcher_round ic_launcher_foreground; do cp www/icon-$2.png $RES/mipmap-$1/$n.png; done; }
put mdpi 72; put hdpi 72; put xhdpi 96; put xxhdpi 144; put xxxhdpi 192
