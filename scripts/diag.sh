#!/bin/bash
date=$(echo `date +\%d-\%m-\%Y` `date +\%H:\%M`)
temp=$(sensors | grep -oP '(?<=temp1:).*')
#freq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
freq=$(/opt/vc/bin/vcgencmd measure_clock arm)
volt=$(/opt/vc/bin/vcgencmd measure_volts)
#kodi_status=$(kodi status)
kodi_status=$(service xbmc status)
echo ${date}\;${temp}\;${freq}\;${volt}\;${kodi_status}
