# This script will be executed in late_start service mode
# More info in the main Magisk thread
MODDIR=${0%/*}

# 判断是否首次加载模块

FIRST=$(find $MODDIR -name debug.log)
if [ -z $FIRST ]; then
 # wait
    sleep 20
# 修复microG
    pm install -f -d -g $MODDIR/system/priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk && echo "修复成功1" >>$MODDIR/debug.log 2>&1 || (echo "安装失败1" >>$MODDIR/debug.log 2>&1)
#    pm install -g $MODDIR/system/priv-app/Phonesky/Phonesky.apk && echo "修复成功2" >>$MODDIR/debug.log 2>&1 || (echo "安装失败2" >>$MODDIR/debug.log 2>&1)
else
   (

#   2022 劳动节快乐！
     echo "2023 天天快乐！" >>$MODDIR/debug.log 2>&1
    

    ) 2>/dev/null


fi