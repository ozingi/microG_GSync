OIFS=$IFS; IFS=\|

case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
	*JAIA1*) JAI=true; JAIA1=true; JAIA2=false; JAIA3=false;;
	*JAIA2*) JAI=true; JAIA1=false; JAIA2=true; JAIA3=false;;
	*JAIA3*) JAI=true; JAIA1=false; JAIA2=false; JAIA3=true;;
	*nJAI*) JAI=false; JAIA1=false; JAIA2=false; JAIA3=false;;
esac
case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
	*nk*) NK=true;;
esac
IFS=$OIFS


		if
		 [ -z $JAI ] || [ -z $JAIA1 ] || [ -z $JAIA2 ] || [ -z $JAIA3 ]; then
 #       	ui_print " Ultimate Statusbar Icon Pack by Jai..... "
#			ui_print " "
#			ui_print "   Select which statusbar bar Icon pack you want among 1, 2 and 3"
#			ui_print " Wifi and signal icon u can change anytime from developer options "
#			ui_print " For screenshots of icons check our telegram channel @cool_modules "
#			ui_print "   Do you want to install statusbar icon pack ?"
			ui_print "�Ƿ���Ҫ��װ microG ?"
			print_modname() {
			  ui_print "*******************************"
			  ui_print "     	Magisk Module:         "
			  ui_print "For HMNote4X    By ��ҹ����"
			  ui_print "*******************************"
			}
			ui_print " "
			ui_print " Press  Vol+ = Yes , Press Vol- = No, and exit "
			if $VKSEL; then
				ui_print " "
				ui_print " "
				ui_print "   Available Icon Packs are as below- "
				ui_print " - Icon Pack 1"
				ui_print " - Icon Pack 2"
				ui_print " - Icon Pack 3"
				ui_print " "
				ui_print " "
#				ui_print "   Pick among 1, 2 or 3" 
				ui_print "   Whether to clear the microG before installing it?(�Ƿ���Ҫִ�иɾ���װmicroG)" 
				ui_print " "
#				ui_print "   Vol+ = Icon Pack-1, Vol- = Show next"
				ui_print "   Vol+ = Yes, Vol- = NO������������=�ǣ�����������=��)"
				JAI=true
				if $VKSEL; then
					JAIA1=true
					JAIA2=false
					JAIA3=false					
				else
#				    ui_print " "
#				    ui_print " "
#					ui_print "   Select Icon Pack 2 or 3 "
#					ui_print " "
#					ui_print "   Vol+ = Icon Pack-2, Vol- = Icon Pack-3" 
#					if $VKSEL; then
#						JAIA1=false
#						JAIA2=true
#						JAIA3=false	
#					else
#						JAIA1=false
#						JAIA2=false
#						JAIA3=true	
					ui_print "   ��ѡ����ֱ�Ӱ�װmicroG,�������ֻ�ʹ��װ��Ч"
#					fi
				fi
			else
				JAI=false
				ui_print "Installation aborted by user, so kthnxbye" 
				exit 1
			fi
		else
	     	ui_print " Ultimate Icon Pack V2 installed successfully..." 
		fi
	

ui_print " Follow @cool_modules69 for more, thanks to @IconicIcons, SIS acherus and other substratum channel and all the people who supported "
ui_print " Icon pack by @Jai_08 "
ui_print "-  Wifi and signal icons u can choose from display cutout option, 10 different sets are present -"

mkdir -p $TMPDIR/system/product/overlay

if $JAI; then
	ui_print "-  - - -  -"
	if $JAIA1; then
		ui_print "-  ж�عȸ������ -"
#		cp -f $TMPDIR/apk/B1.apk $TMPDIR/system/product/overlay
#		cp -f $TMPDIR/apk/IP1.apk $TMPDIR/system/product/overlay
#		ж��gsf
		sudo pm uninstall -k --user 0 com.google.android.webview 
		ls /data/user/0/com.google.android.webview/ >/dev/null || echo "- ж�����"
	elif $JAIA2; then
#		ui_print "-  Icon Pack 2 selected -"
		ui_print "- *********************** -"
#			cp -f $TMPDIR/apk/B2.apk $TMPDIR/system/product/overlay
#		cp -f $TMPDIR/apk/IP2.apk $TMPDIR/system/product/overlay
#	elif $JAIA3; then
#		ui_print "-  Icon Pack 3 selected  -"
#			cp -f $TMPDIR/apk/B3.apk $TMPDIR/system/product/overlay
#		cp -f $TMPDIR/apk/IP3.apk $TMPDIR/system/product/overlay
	fi
fi




ui_print " "
ui_print " "
ui_print "-  Done  -"
