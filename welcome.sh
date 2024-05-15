#!/bin/bash

clear
sleep 1
echo ''
echo -e "\e[1;33m"
echo -e "                 ____         __ _   ____"
echo -e "                / ___|  ___  / _| |_/ ___|  ___ _ ____   _____"
echo -e "                \___ \ / _ \| |_| __\___ \ / _ \ '__\ \ / / _ \\"
echo -e "                 ___) | (_) |  _| |_ ___) |  __/ |   \ V /  __/"
echo -e "                |____/ \___/|_|  \__|____/ \___|_|    \_/ \___|\e[0m"
echo ''
echo ''
echo -e "\e[1;34m"
echo -e "                  ____              ___                 ____"
echo -e "                 |  _ \  _____   __/ _ \ _ __  ___     |___ \\"
echo -e "                 | | | |/ _ \ \ / / | | | '_ \/ __|_____ __) |"
echo -e "                 | |_| |  __/\ V /| |_| | |_) \__ \_____/ __/"
echo -e "                 |____/ \___| \_/  \___/| .__/|___/    |_____|"
echo -e "                                        |_|  \e[0m"
echo ''
echo -e "\e[33mSysInfo ---------------------------------             Server Services status -----------------\e[0m"
echo -e "\e[32mUPTIME: \e[0m" $(uptime -p) "                       \e[32m        HTTPD: \e[0m" $(systemctl show -p ActiveState --value "httpd")
echo -e "\e[32mHOSTNAME: \e[0m" $(hostname) "                      \e[32m             MySQL: \e[0m" $(systemctl show -p ActiveState --value "mysql")
echo -e "\e[32mDISTRIBUTIVE: \e[0m" $(cat /etc/os-release | grep "PRETTY_NAME" | cut -d "=" -f 2- | sed 's/"//g') "               \e[32mMySQLd: \e[0m" $(systemctl show -p ActiveState --value "mysqld")
echo -e "\e[32mCPU LOAD: \e[0m" $(cat /proc/loadavg | awk '{print $1 ", " $2 ", " $3}') "                          \e[32mFirewalld: \e[0m" $(systemctl show -p ActiveState --value "firewalld")
echo -e "\e[32mFREE MEMORY: \e[0m" $(free -m | head -n 2 | tail -n 1 | awk {'print $4'})"Mb" "                                  \e[32mCrond: \e[0m" $(systemctl show -p ActiveState --value "crond")
echo -e "\e[32mFREE DISK SPACE: \e[0m" $(df -h / | awk '{ a = $2 } END { print a }') "                                \e[32miptables: \e[0m" $(systemctl show -p ActiveState --value "iptables")
echo ''
echo -e "\e[33mUseful params ---------------------------\e[0m"
echo -e "\e[32mForward status: \e[0m" $(sysctl net.ipv4.ip_forward)
echo -e "\e[32mPATH env: \e[0m" $(printenv | grep PATH)
echo -e "\e[32mSSH params: \e[0m" $(printenv | grep SSH)
echo -e "\e[32mSockets: \e[0m"
ss -tunlp | awk '!/Process/'
echo ''
echo ''
