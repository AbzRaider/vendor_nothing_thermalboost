##############
# Config Vars
##############

# Set this to true if you don't want to mount the system folder
SKIPMOUNT=false

# Set this to true if you want to debug the installation
DEBUG=true

###############
# Replace List
###############

# List all directories you want to directly replace in the system
# Construct your list in the following example format
REPLACE_EXAMPLE="/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework"

# Construct your own list here
REPLACE=""

##############
# Permissions
##############

set_permissions() {
  set_perm "$MODPATH/system/bin/placeholder" 0 0 0755
  set_perm_recursive "$MODPATH/system" 0 0 0777 0755
  chcon u:object_r:vendor_configs_file:s0 $MODPATH/system/vendor/etc/advance_thermal_mitigation/display_refresh_rate_config.json
  chcon u:object_r:vendor_configs_file:s0 $MODPATH/system/vendor/etc/advance_thermal_mitigation/atmc.json
  chcon u:object_r:vendor_configs_file:s0 $MODPATH/system/vendor/etc/advance_thermal_mitigation/atmc_ind.json
  chcon u:object_r:vendor_configs_file:s0 $MODPATH/system/vendor/etc/advance_thermal_mitigation/nt_boost_adjuster.xml
  chcon u:object_r:vendor_configs_file:s0 $MODPATH/system/vendor/etc/thermal.mid.conf
  


}

#######
# Main
#######

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh