#! /usr/bin/bash
# BACK_RED='\e[0;41m'
# GREEN='\033[1;32m'
BLUE='\033[1;34m'
PURPLE='\033[1;33m'
echo -e "\n\tYour PC-Health Basically :) \033[0m\n"

pcname=$(cat /proc/sys/kernel/hostname)
Username=$USER
file="/sys/class/power_supply/BAT0/capacity"
kernel=$(cat /proc/version)
memory=$(cat  /proc/meminfo | head -3 | sed 's/^/        /')


if [ -e "$file" ]
then
    batterylevel=$(cat ${file})
    batteryhealth=$(cat ${file}_level)
else
    batterylevel=$(cat /sys/class/power_supply/BAT1/capacity)
    batteryhealth=$(cat /sys/class/power_supply/BAT1/capacity_level)
fi

echo -e "${PURPLE}PC-NAME :\033[0m ${pcname} \n"
echo -e "${PURPLE}USERNAME :\033[0m ${Username} \n "
echo -e "${PURPLE}MEMORY:\033[0m"
echo -e "${memory}"
echo -e "\n${PURPLE}KERNEL: \033[0m ${kernel}\n"
echo -e "${PURPLE}BATTERY LEVEL :\033[0m ${batterylevel}%\n"
echo -e "${PURPLE}BATTERY HEALTH:\033[0m ${batteryhealth}\n"

echo -e " ${BLUE} -Made by team avengers \033[0m\n"
