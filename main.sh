#! /usr/bin/bash
BACK_RED='\e[0;41m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
echo -e "\n\t${BACK_RED}${GREEN}Your PC-Health Basically :) \033[0m\n"

pcname=$(cat /proc/sys/kernel/hostname)
Username=$USER
file="/sys/class/power_supply/BAT0/capacity"
kernal=$(cat /proc/version)
memory=$(cat  /proc/meminfo | head -3 | sed 's/^/                  /')


if [ -e "$file" ]
then
    batterylevel=$(cat ${file})
    batteryhealth=$(cat ${file}_level)
else
    batterylevel=$(cat /sys/class/power_supply/BAT1/capacity)
    batteryhealth=$(cat /sys/class/power_supply/BAT1/capacity_level)
fi

echo -e "\t${PURPLE}PC-NAME :\033[0m ${pcname} \n"
echo -e "\t${PURPLE}USERNAME :\033[0m ${Username} \n "
echo -e "\t${PURPLE}MEMORY:\033[0m"
echo -e "${memory}"
echo -e "\n\t${PURPLE}KERNAL: \033[0m ${kernal}\n"
echo -e "\t${PURPLE}BATTERY LEVEL :\033[0m ${batterylevel}%\n"
echo -e "\t${PURPLE}BATTERY HEALTH:\033[0m ${batteryhealth}\n"

echo -e "\t ${BLUE} -Made by team avengers \033[0m\n"
