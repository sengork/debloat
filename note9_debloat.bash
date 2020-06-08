#!/bin/bash

# Tested on SM-N960F Stock Firmware
# References: 
#  https://forum.xda-developers.com/galaxy-note-9/how-to/note-9-debloat-bash-script-t3907659
#  https://docs.samsungknox.com/CCMode/N960F_P.pdf

#set -x
#set -v

export UNINSTALL="
com.facebook.katana
com.facebook.system
com.facebook.appmanager
flipboard.boxer.app
flipboard.app
tv.peel.smartremote
com.sec.android.widgetapp.samsungapps
com.sec.android.directshare
com.sec.android.widgetapp.easymodecontactswidget
com.sec.android.cloudagent.dropboxoobedummy
com.sec.android.widgetapp.tapandpay
com.sec.android.widgetapp.webmanual
com.android.printspooler
com.sec.app.samsungprintservice
com.sec.android.widgetapp.ap.hero.accuweather
com.sec.android.widgetapp.activeapplicationwidget
com.samsung.android.app.simplesharing
com.sec.allsharecastplayer
com.dropbox.android
com.samsung.android.app.vrsetupwizardstub
com.samsung.android.hmt.vrshell
com.samsung.android.hmt.vrsvc
com.samsung.android.app.mirrorlink
com.samsung.android.allshare.service.fileshare
com.evernote
com.monotype.android.font.cooljazz
com.monotype.android.font.rosemary
com.samsung.android.allshare.service.mediashare
com.google.android.play.games
com.google.android.apps.magazines
com.google.android.videos
com.dsi.ant.service.socket
com.dsi.ant.sample.acquirechannels
com.dsi.ant.server
com.dsi.ant.plugins.antplus
com.sec.penup
com.sec.android.app.tourviewer
com.google.android.apps.plus
com.google.android.apps.books
com.google.android.music
com.google.android.talk
com.sec.android.app.billing
com.sec.android.app.easylauncher
com.google.android.feedback
com.monotype.android.font.chococooky
com.android.chrome
com.android..phototable
com.android.dreams.basic
com.google.android.apps.photos
com.android.stk
com.android.stk2
com.samsung.android.app.settings.bixby
com.samsung.systemui.bixby2
com.samsung.android.bixby.service
com.samsung.android.bixby.agent
com.samsung.android.bixbyvision.framework
com.samsung.android.bixby.wakeup
com.samsung.android.bixby.agent.dummy
com.samsung.android.samsungpass
com.samsung.android.samsungpassautofill
com.android.dreams.basic
com.samsung.android.themestore
com.microsoft.office.excel
com.microsoft.office.word
com.microsoft.office.powerpoint
com.samsung.android.app.watchmanagerstub
com.sec.android.mimage.gear360editor
com.samsung.android.app.advsounddetector
com.samsung.android.app.spage
com.sec.android.app.chromecustomizations
com.chrome.deviceextras.samsung
com.samsung.android.app.camera.sticker.facearavatar.preload
com.samsung.android.app.camera.sticker.facearexpression.preload
com.samsung.android.aremoji
com.samsung.app.highlightplayer
com.microsoft.appmanager
com.samsung.android.mdx.quickboard
com.samsung.android.mdx
com.samsung.android.forest
com.google.android.projection.gearhead
com.google.android.apps.tachyon
com.sec.android.app.ve.vebgm
com.android.theme.icon.square
com.android.theme.color.cinnamon
com.android.theme.icon.square
com.android.theme.color.ocean
com.android.theme.color.space
com.android.theme.color.green
com.android.theme.icon_pack.circular.themepicker
com.android.theme.icon_pack.circular.settings
com.android.theme.icon.teardrop
com.android.theme.color.orchid
com.android.theme.color.purple
com.samsung.android.themecenter
com.samsung.android.visionarapps
"

export DISABLE="
com.samsung.android.app.appsedge
com.samsung.android.spayfw
com.samsung.android.themecenter
com.samsung.android.messaging
com.samsung.android.smartswitchassistant
com.samsung.android.app.camera.sticker.facear.preload
com.samsung.android.app.camera.sticker.facearframe.preload
com.samsung.android.app.camera.sticker.facear3d.preload
com.samsung.android.app.social
com.sec.android.desktopcommunity
com.samsung.android.kidsinstaller
com.sec.android.easyMover.Agent
com.sec.epdgtestapp
com.google.ar.core
com.samsung.SMT.lang_en_au_f00
com.samsung.android.smartmirroring
com.sec.android.diagmonagent
com.samsung.android.scloud
com.sec.android.app.camera.avatarauth
com.samsung.android.app.omcagent
com.samsung.android.bbc.bbcagent
com.samsung.android.biometrics.service
com.samsung.android.dqagent
com.samsung.android.dsms
com.samsung.android.fmm
com.samsung.android.ipsgeofence
com.samsung.android.keyguardwallpaperupdator
com.samsung.android.kgclient
com.samsung.android.mdecservice
com.samsung.android.mdm
com.samsung.android.mobileservice
com.samsung.android.net.wifi.wifiguider
com.samsung.android.nlphub
com.samsung.android.rlc
com.samsung.android.server.iris
com.samsung.android.service.livedrawing
com.samsung.android.service.pentastic
com.samsung.android.setting.multisound
com.samsung.android.svcagent
com.samsung.android.themecenter
com.samsung.crane
com.samsung.rcs
com.sec.android.app.ocrservice
com.sec.imslogger
com.sec.mldapchecker
com.samsung.klmsagent
com.samsung.clipboardsaveservice
com.samsung.android.clipboarduiservice
com.samsung.visionprovider
com.google.android.onetimeinitializer
com.samsung.android.app.readingglass
com.android.managedprovisioning
com.samsung.android.service.airviewdictionary
com.google.android.tts
com.android.providers.userdictionary
com.samsung.android.app.camera.sticker.stamp.preload
com.samsung.android.app.talkback
com.sec.android.uibcvirtualsoftkey
com.android.providers.partnerbookmarks
com.android.bookmarkprovider
com.sem.factoryapp
com.sec.factory.iris.usercamera
com.sec.factory.iris.camera
com.samsung.android.lool
com.sec.spp.push
com.samsung.android.biometrics.app.setting
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
