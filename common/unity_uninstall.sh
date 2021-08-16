PRIVE_APP='/data/resource-cache/priv-app.list'
if [ -f "$PRIVE_APP" ]; then
  ui_print " "
  ui_print "   Removing $PRIVE_APP"
  rm -f "$PRIVE_APP"
  rm -rf /data/resource-cache
fi
