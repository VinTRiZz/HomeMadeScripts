#! /bin/bash

echo "Setting up firewall"
ufw enable &&
ufw deny incoming &&
ufw default deny incoming &&
ufw deny ssh
echo "Firewall setup complete"

echo "Setting up throttling config for processor"
cp preparedConfigs/thermal-conf.xml /etc/thermald
systemctl restart thermald
echo "Complete"

GITHUB_MAIL="NONE"
GITHUB_USERNAME="NONE"
echo "Configuring github. Leave email or username empty to skip step"
read -p "Write your email for github: " GITHUB_MAIL
if [ "$GITHUB_MAIL" == "" ]; then
echo "Invalid email (empty). Email set and keygen skipped"
else
echo "Setting up email"
git config --global user.email "$GITHUB_MAIL"
echo "Generating keys"
ssh-keygen -t ed25519 -C "$GITHUB_MAIL"
echo "Complete"
fi

read -p "Write your username for github: " GITHUB_USERNAME
if [ "$GITHUB_MAIL" == "" ]; then
echo "Invalid username (empty). Username skipped"
else
echo "Setting up username"
git config --global user.name "$GITHUB_USERNAME"
echo "Complete"
fi

read -p "Github config complete. Press return key to continue..."

