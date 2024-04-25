#!/usr/bin/env bash
set -e
error() { echo -e "\e[31m[error] $*\e[39m"; exit 1; }
if [[ $EUID != 0 ]]; then error This installer requires root privileges. Try again as \"root\" ... ; fi
# apt update && apt upgrade -y
# apt install mc armbian-config -y
rm -f /usr/lib/firmware/brcm/brcmfmac4334-sdio.rockchip,rk3318-box.txt
curl -sL "https://raw.githubusercontent.com/ntguest/rk3118-box/main/files/rk3118-wifi" > "/usr/lib/firmware/brcm/brcmfmac4334-sdio.rockchip,rk3318-box.txt"
echo activity > /sys/devices/platform/gpio-leds/leds/working/trigger
reboot
