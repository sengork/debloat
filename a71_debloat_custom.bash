#!/bin/bash

# Tested on SM-A715F Stock Firmware
# References: 
#  https://forum.xda-developers.com/galaxy-note-9/how-to/note-9-debloat-bash-script-t3907659
#  https://docs.samsungknox.com/CCMode/N960F_P.pdf

#set -x
#set -v

export UNINSTALL="
com.samsung.android.app.settings.bixby
com.samsung.systemui.bixby2
com.samsung.android.bixby.service
com.samsung.android.bixby.agent
com.samsung.android.bixbyvision.framework
com.samsung.android.bixby.wakeup
com.samsung.android.bixby.agent.dummy
com.sec.android.app.chromecustomizations
com.google.android.googlequicksearchbox
com.samsung.android.aremoji
com.samsung.android.app.social
com.samsung.android.kidsinstaller
com.samsung.android.easysetup
com.samsung.android.rubin.app
com.samsung.faceservice
com.sec.android.app.voicenote
com.netflix.partner.activation
com.sec.android.widgetapp.easymodecontactswidget
com.sec.android.smartfpsadjuster
com.sec.android.app.billing
com.samsung.android.game.gamehome
com.google.ar.core
com.microsoft.skydrive
com.samsung.android.smartface
com.samsung.android.emojiupdater
com.google.android.apps.tachyon
com.android.settings.intelligence
com.microsoft.office.outlook
com.facebook.services
com.android.dreams.basic
com.samsung.knox.securefolder
com.samsung.android.game.gametools
com.samsung.android.app.simplesharing
com.samsung.android.service.peoplestripe
com.samsung.android.smartcallprovider
com.dsi.ant.service.socket
com.dsi.ant.sample.acquirechannels
com.dsi.ant.plugins.antplus
com.dsi.ant.server
com.samsung.crane
com.samsung.android.ardrawing
com.android.chrome
com.samsung.android.aremojieditor
com.samsung.android.allshare.service.fileshare
com.netflix.partner.activation
com.netflix.mediaclient
flipboard.boxer.app
com.google.android.feedback
com.samsung.android.arzone
com.facebook.services
com.facebook.katana
com.facebook.system
com.facebook.appmanager
com.android.providers.partnerbookmarks
com.samsung.android.beaconmanager
com.samsung.android.stickercenter
com.sec.android.autodoodle.service
com.samsung.android.samsungpass
com.sec.android.app.kidshome
com.samsung.android.app.sharelive
com.samsung.android.app.spage
com.sec.android.mimage.avatarstickers
com.samsung.android.livestickers
com.hiya.star
com.samsung.android.allshare.service.fileshare
com.samsung.android.allshare.service.mediashare
com.samsung.android.app.dressroom
"

export DISABLE="
com.samsung.android.scloud
"


export IFS="
"

echo Uninstalling
for i in $UNINSTALL
do
	echo $i
	./adb.exe shell "pm uninstall --user 0 $i"
	./adb.exe shell "am force-stop --user 0 $i"
done

echo
echo Disabling and force stopping
for i in $DISABLE
do
	echo $i
	./adb.exe shell "pm disable-user --user 0 $i"
	./adb.exe shell "am force-stop --user 0 $i"
done
