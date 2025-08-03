##########################################################################################
#
# Magisk Module Installation Script
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place the file in the system folder (remove the placeholder file)
# 2. Fill in your module information in module.prop
# 3. Configure and adjust in this file
# 4. If you need to execute scripts on boot, add them to post-fs-data.sh or service.sh
# 5. Add other or modified system properties to system.prop
#
##########################################################################################
##########################################################################################
#
# The installation framework will export some variables and functions.
# You should use these variables and functions for installation.
#
# ! Do not use any internal paths of Magisk, as they are not public APIs.
# ! Do not use other functions in util_functions.sh, as they are also not public APIs.
# ! Non-public APIs cannot guarantee compatibility between versions.
#
# Available Variables:
#
# MAGISK_VER (string): The string of the currently installed version of Magisk (in string format)
# MAGISK_VER_CODE (int): The code of the currently installed version of Magisk (in integer format)
# BOOTMODE (bool): True if the module is currently installed in Magisk Manager.
# MODPATH (path): The path where your module should be installed
# TMPDIR (path): A path where you can temporarily store files
# ZIPFILE (path): The path of the module's installation package (zip)
# ARCH (string): The architecture of the device. Its value can be one of arm, arm64, x86, x64
# IS64BIT (bool): True if $ARCH (the ARCH variable above) is arm64 or x64.
# API (int): The API level of the device (Android version)
#
# Available Functions:
#
# ui_print <msg>
#     Prints <msg> to the console
#     Avoid using 'echo' as it will not display in the custom recovery console.
#
# abort <msg>
#     Prints error message <msg> to the console and terminates the installation
#     Avoid using 'exit' as it will skip the cleanup steps on termination
#
##########################################################################################

##########################################################################################
# Variables
##########################################################################################

# If you need more customization and want to do everything yourself
# Please set SKIPUNZIP=1 in custom.sh
# to skip the extraction operation and apply default permissions/context steps.
# Note that after doing this, your custom.sh will be responsible for installing everything on its own.
SKIPUNZIP=0
# If you need to call the busybox inside Magisk
# Please set ASH_STANDALONE=1 in custom.sh
ASH_STANDALONE=0

##########################################################################################
# Replacement List
##########################################################################################

# List all the directories you want to replace directly in the system
# Refer to the documentation for more information on how Magic Mount works and why you need it

# Build the list in the following format
# This is an example
REPLACE="
# Add your directories here
"

# Create your own list here
REPLACE="
"
##########################################################################################
# Installation Settings
##########################################################################################

# If SKIPUNZIP=1, you may need to use the following code
# Of course, you can also customize the installation script; remove # when needed
# Extract $ZIPFILE to $MODPATH
#  ui_print "- Extracting module files"
#  unzip -o "$ZIPFILE" -x 'META-INF/*' -d $MODPATH >&2
# Remove unnecessary files
# rm -rf \
# $MODPATH/system/placeholder $MODPATH/customize.sh \
# $MODPATH/*.md $MODPATH/.git* $MODPATH/LICENSE 2>/dev/null

##########################################################################################
# Permission Settings
##########################################################################################

# Please note that all files/folders in the magisk module directory have the $MODPATH prefix - keep this prefix for all files/folders
# Some examples:

# For directories (including files):
# set_perm_recursive  <directory>                <owner> <group> <directory permissions> <file permissions> <context> (default is: u:object_r:system_file:s0)

# set_perm_recursive $MODPATH/system/lib 0 0 0755 0644
# set_perm_recursive $MODPATH/system/vendor/lib/soundfx 0 0 0755 0644

# For files (excluding the directory containing the file)
# set_perm  <filename>                         <owner> <group> <file permissions> <context> (default is: u:object_r:system_file:s0)

# set_perm $MODPATH/system/lib/libart.so 0 0 0644
# set_perm /data/local/tmp/file.txt 0 0 644

on_install()
{
# Cortex-A510 (base 2.0GHz)
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo 1670400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo 1670400 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
echo 1670400 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq

# Cortex-A710 (base 2.8GHz)
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
echo 2323200 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo 2323200 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq

# Cortex-A715 (base 2.8GHz)
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq
echo 2323200 > /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq
echo 2323200 > /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq

# Cortex-X3 (base 3.2GHz)
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq
echo 2227200 > /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq


# Adreno 740
#chmod 644 /sys/class/kgsl/kgsl-3d0/max_pwrlevel
#echo 4 > /sys/class/kgsl/kgsl-3d0/max_pwrlevel
}

# Default permissions, please do not delete
set_perm_recursive $MODPATH 0 0 0755 0644

