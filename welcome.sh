#!/bin/bash

green='\e[32m'
yellow='\e[33m'
blue='\e[34m'
reset='\e[0m'

print_row() {
    printf "| %-20s | %-25s |\n" "$1" "$2"
}

print_color() {
    local color="$1"
    shift
    printf "${!color}%s${reset}\n" "$@"
}

clear
sleep 1
print_color yellow "         ____         __ _   ____"
print_color yellow "        / ___|  ___  / _| |_/ ___|  ___ _ ____   _____"
print_color yellow "        \___ \ / _ \| |_| __\___ \ / _ \ '__\ \ / / _ \\"
print_color yellow "         ___) | (_) |  _| |_ ___) |  __/ |   \ V /  __/"
print_color yellow "        |____/ \___/|_|  \__|____/ \___|_|    \_/ \___|"
print_color blue "          ____              ___                 ____"
print_color blue "         |  _ \  _____   __/ _ \ _ __  ___     |___ \\"
print_color blue "         | | | |/ _ \ \ / / | | | '_ \/ __|_____ __) |"
print_color blue "         | |_| |  __/\ V /| |_| | |_) \__ \_____/ __/"
print_color blue "         |____/ \___| \_/  \___/| .__/|___/    |_____|"
print_color blue "                                |_|"

echo ""

print_row "SysInfo" "Values"
print_row "--------------------" "-------------------------"
print_row "UPTIME" "$(uptime -p)"
print_row "HOSTNAME" "$(hostname)"
print_row "DISTRIBUTIVE" "$(cat /etc/os-release | grep "PRETTY_NAME" | cut -d "=" -f 2- | sed 's/"//g')"
print_row "CPU LOAD" "$(cat /proc/loadavg | awk '{print $1 ", " $2 ", " $3}')"
print_row "FREE MEMORY" "$(free -m | head -n 2 | tail -n 1 | awk {'print $4'})Mb"
print_row "FREE DISK SPACE" "$(df -h / | awk '{ a = $2 } END { print a }')"

echo ""

print_row "Server Services" "Status"
print_row "--------------------" "-------------------------"
print_row "HTTPD" "$(systemctl show -p ActiveState --value "httpd")"
print_row "MySQL" "$(systemctl show -p ActiveState --value "mysql")"
print_row "MySQLd" "$(systemctl show -p ActiveState --value "mysqld")"
print_row "Firewalld" "$(systemctl show -p ActiveState --value "firewalld")"
print_row "Crond" "$(systemctl show -p ActiveState --value "crond")"
print_row "Iptables" "$(systemctl show -p ActiveState --value "iptables")"
print_row "Forward status" "$(sysctl net.ipv4.ip_forward)"

echo ""

echo -e "${yellow}PATH env: ${reset}" 
echo -e "$(printenv | grep PATH)"
echo -e "${yellow}SSH params: ${reset}" 
echo -e "$(printenv | grep SSH)"
echo -e "${yellow}Sockets: ${reset}"
ss -tunlp | awk '!/Process/'