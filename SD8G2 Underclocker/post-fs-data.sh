#!/system/bin/sh
# Do not assume where your module will be located.
# If you need to know the location of this script and the module, use $MODDIR
# This will ensure that your module continues to work properly
# even if Magisk changes its mount points in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode