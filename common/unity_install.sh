OIFS=$IFS; IFS=\|

case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
	*clearG1*) microG=true; clearG1=true; clearG2=false; clearG3=false;;
	*clearG2*) microG=true; clearG1=false; clearG2=true; clearG3=false;;
	*clearG3*) microG=true; clearG1=false; clearG2=false; clearG3=true;;
	*nmicroG*) microG=false; clearG1=false; clearG2=false; clearG3=false;;
esac
case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
	*nk*) NK=true;;
esac
IFS=$OIFS


		if
		 [ -z $microG ] || [ -z $clearG1 ] || [ -z $clearG2 ] || [ -z $clearG3 ]; then
			echo "                _                          ______";
			echo "   ____ ___    (_)  _____   _____  ____   / ____/";
			echo "  / __ \`__ \  / /  / ___/  / ___/ / __ \ / / __  ";
			echo " / / / / / / / /  / /__   / /    / /_/ // /_/ /  ";
			echo "/_/ /_/ /_/ /_/   \___/  /_/     \____/ \____/   ";
			echo "                                                 ";
			ui_print "- 是否需要安装 microG ?"
			ui_print "   Do you want to install microG  ?"
			ui_print "- 按下音量加=是，按下音量减=否,和退出"
			ui_print "   Press  Vol+ = Yes , Press Vol- = No, and exit "
			if $VKSEL; then
				ui_print " "
				ui_print " "
				ui_print " "
				ui_print "- 是否需要执行干净安装microG？"
#				ui_print "   Pick among 1, 2 or 3" 
				ui_print "   Whether to clear the microG before installing it?" 
				ui_print " "
#				ui_print "   Vol+ = Icon Pack-1, Vol- = Show next"
				ui_print "- 按下音量加=是，按下音量减=否"
				ui_print "   Vol+ = Yes, Vol- = NO"
				microG=true
				if $VKSEL; then
					clearG1=true
					clearG2=false
					clearG3=false					
				else
#				    ui_print " "
#				    ui_print " "
#					ui_print "   Select Icon Pack 2 or 3 "
#					ui_print " "
#					ui_print "   Vol+ = Icon Pack-2, Vol- = Icon Pack-3" 
#					if $VKSEL; then
#						clearG1=false
#						clearG2=true
#						clearG3=false	
#					else
#						clearG1=false
#						clearG2=false
#						clearG3=true	
					clearG1=false
					clearG2=true
					clearG3=false
					ui_print "- 你选择了直接安装microG,正在安装中..."
					ui_print "   You chose to install microG directly, it is being installed..."
#					fi
				fi
			else
				microG=false
				ui_print "- 安装被取消，microG未生效" 
				ui_print "  The installation was cancelled and microG did not take effect" 
				exit 1
			fi
		else
			ui_print "- microG已安装成功" 
	     	ui_print "  The microG has been installed successfully" 
		fi
	

#ui_print "- Follow github：taoaoooo/qq群：273145623"
#ui_print "  Follow Github: taoaoooo/QQ group: 273145623"

mkdir -p $TMPDIR/system

if $microG; then
	ui_print ">"
	if $clearG1; then
		ui_print "-  挂载根目录..."
		mount -o rw,remount / || echo "error code:85"
		ui_print "-  Uninstall the gsf..."
#		cp -f $TMPDIR/apk/B1.apk $TMPDIR/system/product/overlay
#		cp -f $TMPDIR/apk/IP1.apk $TMPDIR/system/product/overlay
#		卸载gsf
		pm uninstall -k --user 0 com.google.android.gsf
		rm -rf /system/priv-app/GoogleServicesFramework || echo "error code:91"
		rm -rf /system/app/GoogleServicesFramework
		rm -rf /system/product/priv-app/GoogleServicesFramework
		rm -rf /system/product/app/GoogleServicesFramework
		rm -rf /system/system_ext/priv-app/GoogleServicesFramework || echo "error code:95"
		rm -rf /system/system_ext/app/GoogleServicesFramework
		ui_print "-  Uninstall the gms..."
		pm uninstall -k --user 0 com.google.android.gms
		rm -rf /system/priv-app/PrebuiltGmsCore
		rm -rf /system/app/PrebuiltGmsCore
		rm -rf /system/product/priv-app/PrebuiltGmsCore
		rm -rf /system/product/app/PrebuiltGmsCore
		rm -rf /system/system_ext/priv-app/PrebuiltGmsCore
		rm -rf /system/system_ext/app/PrebuiltGmsCore
		ui_print "-  Uninstall the playStore..."
		pm uninstall -k --user 0 com.google.android.vending
		rm -rf /system/priv-app/Phonesky
		rm -rf /system/app/Phonesky
		rm -rf /system/product/priv-app/Phonesky
		rm -rf /system/product/app/Phonesky
		rm -rf /system/system_ext/priv-app/Phonesky
		rm -rf /system/system_ext/app/Phonesky
		ui_print "-  Uninstall the googleContactsSync..."
		pm uninstall -k --user 0 com.google.android.syncadapters.contacts
		rm -rf /system/priv-app/GoogleContactsSyncAdapter
		rm -rf /system/app/GoogleContactsSyncAdapter
		rm -rf /system/product/priv-app/GoogleContactsSyncAdapter
		rm -rf /system/product/app/GoogleContactsSyncAdapter
		rm -rf /system/system_ext/priv-app/GoogleContactsSyncAdapter
		rm -rf /system/system_ext/app/GoogleContactsSyncAdapter
		ui_print "-  Uninstall the droidguard..."
		pm uninstall -k --user 0 org.microg.gms.droidguard
		rm -rf /system/priv-app/DroidGuard
		rm -rf /system/app/DroidGuard
		rm -rf /system/product/priv-app/DroidGuard
		rm -rf /system/product/app/DroidGuard
		rm -rf /system/system_ext/priv-app/DroidGuard
		rm -rf /system/system_ext/app/DroidGuard
		ls /data/user/0/com.google.android.vending >/dev/null || echo "-  卸载残留已清理"&&echo "  Uninstallation residue has been cleared"
		ui_print "-  恢复根目录只读..."
		mount -o ro,remount /
	elif $clearG2; then
#		ui_print "-  Icon Pack 2 selected -"
		ui_print "- 安装完毕 -"
#			cp -f $TMPDIR/apk/B2.apk $TMPDIR/system/product/overlay
#		cp -f $TMPDIR/apk/IP2.apk $TMPDIR/system/product/overlay
#	elif $clearG3; then
#		ui_print "-  Icon Pack 3 selected  -"
#			cp -f $TMPDIR/apk/B3.apk $TMPDIR/system/product/overlay
#		cp -f $TMPDIR/apk/IP3.apk $TMPDIR/system/product/overlay
	fi
fi




ui_print " "
ui_print " "
ui_print "- Done  -"
