#!/system/bin/sh
# 不要假设您的模块将位于何处。
# 如果您需要知道此脚本和模块的放置位置，请使用$MODDIR
# 这将确保您的模块仍能正常工作
# 即使Magisk将来更改其挂载点
MODDIR=${0%/*}

# 此脚本将在late_start service 模式执行

# 等待开机30秒后开始执行
sleep 30

chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo 2227200 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq
echo 2496000 > /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq
chmod 644 /sys/class/kgsl/kgsl-3d0/max_pwrlevel
echo 4 > /sys/class/kgsl/kgsl-3d0/max_pwrlevel

# 结束
exit 0
