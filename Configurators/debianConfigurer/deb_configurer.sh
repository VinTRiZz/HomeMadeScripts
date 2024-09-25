#! /bin/bash

if ("$USERNAME" == "root"); then
echo "No root in start. Run by yourself, we will ask for root later"
exit 1
fi

USERNAME_NR="$USERNAME"

mkdir tmp 2> /dev/null

BASEPATH=$(dirname $(realpath "$0"))
chmod +x "$BASEPATH/submodules/"

SUBMODULES=(
libInstaller
packageInstaller
etcInstaller
commonConfiger
)

{
for submodule in ${SUBMODULES[@]}; do
sudo "$BASEPATH/submodules/$submodule.sh"
done
} 2>>configure.log
