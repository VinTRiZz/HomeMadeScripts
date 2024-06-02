#! /bin/bash

INSTALLATIONS=(

# Common
kde-plasma-desktop
kde-spectacle
fish
curl
htop
testdisk
ufw

# Compilation
build-essential
gcc
make
cmake
libboost-all-dev
linux-headers-$(uname -r)

# Coding
qtcreator
codeblocks-contrib

# Etc
pciutils
linux-headers-$(uname -r)

# Network
ufw
nmap

)

{
apt update && apt upgrade -y &> /dev/null

for installPacket in ${INSTALLATIONS[@]}; do
if (dpkg -l "$installPacket" &> /dev/null); then
echo -e "\033[32mOK\033[0m Package already installed: $installPacket"
else
apt install "$installPacket" -y
fi
done
} 2>> errors.log
