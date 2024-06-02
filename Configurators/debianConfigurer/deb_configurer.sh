#! /bin/bash

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
"$BASEPATH/submodules/$submodule.sh"
done
} 2>>configure.log
