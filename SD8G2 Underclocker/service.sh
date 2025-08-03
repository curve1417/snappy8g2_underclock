#!/system/bin/sh
# Do not assume where your module will be located.
# If you need to know the location of this script and the module, use $MODDIR
# This will ensure that your module continues to work properly
# even if Magisk changes its mount points in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode

# Start execution after waiting for 30 seconds after boot
sleep 30

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

# End
exit 0
