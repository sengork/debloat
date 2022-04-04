#!/bin/bash

# Tested on SM-A715F Stock Firmware
# References: 
#  https://forum.xda-developers.com/galaxy-note-9/how-to/note-9-debloat-bash-script-t3907659
#  https://docs.samsungknox.com/CCMode/N960F_P.pdf
#  https://r1.community.samsung.com/t5/others/how-to-remove-samsung-bloatware-without-root/td-p/5817510

#set -x
#set -v

export UNINSTALL="
com.samsung.android.app.settings.bixby
com.samsung.systemui.bixby2
com.samsung.android.bixby.service
com.samsung.android.bixby.agent
com.samsung.android.bixbyvision.framework
com.samsung.android.bixby.wakeup
com.sec.android.app.chromecustomizations
com.android.chrome
com.google.android.googlequicksearchbox
com.samsung.android.aremoji
com.samsung.android.aremojieditor
com.facebook.services
com.facebook.orca
com.facebook.system
com.facebook.appmanager
com.netflix.partner.activation
com.netflix.mediaclient
com.samsung.android.kidsinstaller
com.sec.android.app.kidshome
com.samsung.android.aremoji
com.google.ar.core
com.samsung.android.ardrawing
com.samsung.android.aremojieditor
com.samsung.android.arzone
com.samsung.crane
com.samsung.android.ardrawing
com.samsung.android.allshare.service.fileshare
com.samsung.android.app.sharelive
com.samsung.android.allshare.service.mediashare
com.google.android.feedback
com.sec.android.smartfpsadjuster
com.samsung.android.smartcallprovider
com.samsung.android.smartface
com.samsung.android.smartface
com.google.android.partnersetup
com.android.providers.partnerbookmarks
com.samsung.android.app.spage
com.samsung.android.app.camera.sticker.facearavatar.preload
com.samsung.android.stickercenter
com.sec.android.mimage.avatarstickers
com.samsung.android.livestickers
com.samsung.faceservice
com.samsung.android.easysetup
com.sec.android.widgetapp.easymodecontactswidget
com.samsung.android.beaconmanager
com.microsoft.appmanager
com.microsoft.skydrive
com.samsung.android.samsungpass
com.samsung.android.samsungpassautofill
com.android.dreams.basic
com.android.dreams.phototable
com.samsung.android.rubin.app
com.sec.android.app.billing
com.sec.android.app.voicenote
com.samsung.android.svoiceime
com.samsung.android.game.gamehome
com.samsung.android.game.gametools
com.samsung.android.game.gos
com.google.android.apps.tachyon
com.samsung.android.knox.containercore
com.samsung.android.knox.kpecore
com.samsung.android.knox.pushmanager
com.samsung.android.knox.attestation
com.samsung.android.knox.containeragent
com.samsung.knox.securefolder
com.samsung.android.knox.analytics.uploader
com.knox.vpn.proxyhandler
com.sec.enterprise.knox.cloudmdm.smdms
com.samsung.android.privateshare
com.hiya.star
com.samsung.android.app.spage
com.samsung.android.spayfw
com.samsung.android.service.peoplestripe
com.sec.android.autodoodle.service
com.android.bips
com.android.printspooler
com.google.android.printservice.recommendation
com.samsung.android.da.daagent
com.samsung.android.app.watchmanagerstub
com.samsung.android.authfw
com.samsung.android.forest
com.samsung.android.mdx.quickboard
com.samsung.android.mdx.kit
com.samsung.android.mdx
com.touchtype.swiftkey
com.swiftkey.swiftkeyconfigurator
com.samsung.android.dynamiclock
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

# com.android.settings.intelligence - removing will break settings search
# com.samsung.android.app.dressroom - will break wallpapers



# S22 Default packages

