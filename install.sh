##########################################################################################
#
# Unity Config Script
# by topjohnwu, modified by Zackptg5
#
##########################################################################################

##########################################################################################
# Unity Logic - Don't change/move this section
##########################################################################################

if [ -z $UF ]; then
  UF=$TMPDIR/common/unityfiles
  unzip -oq "$ZIPFILE" 'common/unityfiles/util_functions.sh' -d $TMPDIR >&2
  [ -f "$UF/util_functions.sh" ] || { ui_print "! Unable to extract zip file !"; exit 1; }
  . $UF/util_functions.sh
fi

comp_check

##########################################################################################
# Config Flags
##########################################################################################

# Uncomment and change 'MINAPI' and 'MAXAPI' to the minimum and maximum android version for your mod
# Uncomment DYNLIB if you want libs installed to vendor for oreo+ and system for anything older
# Uncomment SYSOVER if you want the mod to always be installed to system (even on magisk) - note that this can still be set to true by the user by adding 'sysover' to the zipname
# Uncomment DIRSEPOL if you want sepolicy patches applied to the boot img directly (not recommended) - THIS REQUIRES THE RAMDISK PATCHER ADDON (this addon requires minimum api of 17)
# Uncomment DEBUG if you want full debug logs (saved to /sdcard in magisk manager and the zip directory in twrp) - note that this can still be set to true by the user by adding 'debug' to the zipname
#MINAPI=21
#MAXAPI=25
#DYNLIB=true
#SYSOVER=true
#DIRSEPOL=true
#DEBUG=true

# Uncomment if you do *NOT* want Magisk to mount any files for you. Most modules would NOT want to set this flag to true
# This is obviously irrelevant for system installs. This will be set to true automatically if your module has no files in system
#SKIPMOUNT=true

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
#REPLACE_EXAMPLE="
#/system/app/Youtube
#/system/priv-app/SystemUI
#/system/priv-app/Settings
#/system/framework
#"

# Construct your own list here
REPLACE="
    /system/app/GoogleServicesFramework
    /system/app/PrebuiltGmsCore
    /system/product/app/PrebuiltGmsCore
    /system/product/app/GoogleServicesFramework
    /system/product/priv-app/PrebuiltGmsCore
    /system/product/priv-app/GmsCore
    /system/product/priv-app/GoogleServicesFramework
    /system/system_ext/app/GoogleServicesFramework
    /system/system_ext/app/PrebuiltGmsCore
    /system/system_ext/priv-app/GoogleServicesFramework
    /system/system_ext/priv-app/PrebuiltGmsCore
	/system/my_carrier/priv-app/GmsCore
    /system/my_bigball/priv-app/GmsCore
    /system/my_heytap/priv-app/GmsCore
    /system/my_carrier/non_overlay/priv-app/GoogleServicesFramework
    /system/my_bigball/non_overlay/priv-app/GoogleServicesFramework
    /system/my_heytap/non_overlay/priv-app/GoogleServicesFramework
 "
#   /system/priv-app/GoogleServicesFramework
#   /system/priv-app/PrebuiltGmsCore
#   /system/priv-app/Phonesky
#    /system/system_ext/priv-app/TrebuchetQuickStep
#    /system/system_ext/priv-app/Lawnchair
#  /system/app/Phonesky
#     /system/product/app/Phonesky
#     /system/system_ext/app/Phonesky
#     /system/product/priv-app/Phonesky
#     /system/system_ext/priv-app/Phonesky
##########################################################################################
# Custom Logic
##########################################################################################

# Set what you want to display when installing your module

print_modname() {
  ui_print "************************************************************"
  ui_print "   microG_Gsync_installer    "
  ui_print "************************************************************"
  ui_print "༼ つ ◕_◕ ༽つ我在 @深夜听表/Github: ozingi/qq群: 273145623"
  ui_print " "
  unity_main # Don't change this line
}

set_permissions() {
  : # Remove this if adding to this function

  # Note that all files/folders have the $UNITY prefix - keep this prefix on all of your files/folders
  # Also note the lack of '/' between variables - preceding slashes are already included in the variables
  # Use $VEN for vendor (Do not use /system$VEN, the $VEN is set to proper vendor path already - could be /vendor, /system/vendor, etc.)

  # Some examples:
  
  # For directories (includes files in them):
  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  
  # set_perm_recursive $UNITY/system/lib 0 0 0755 0644
  # set_perm_recursive $UNITY$VEN/lib/soundfx 0 0 0755 0644

  # For files (not in directories taken care of above)
  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  
  # set_perm $UNITY/system/lib/libart.so 0 0 0644
}

# Custom Variables for Install AND Uninstall - Keep everything within this function - runs before uninstall/install
unity_custom() {
  : # Remove this if adding to this function
}

# Custom Functions for Install AND Uninstall - You can put them here
on_install() {
   ui_print "- 安装完成后，可以重新启动microG使其生效"
   ui_print "  Once installed, you can restart microG to take effect"
   ui_print " ༼ つ ◕_◕ ༽つ"
   
unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}