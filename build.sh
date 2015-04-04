#!/bin/bash

# AOSP-Nexus.

# Prepare output customization commands
red=$(tput setaf 1)             #  red
grn=$(tput setaf 2)             #  green
blu=$(tput setaf 4)             #  blue
cya=$(tput setaf 6)             #  cyan
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldgrn=${txtbld}$(tput setaf 2) #  green
bldblu=${txtbld}$(tput setaf 4) #  blue
bldcya=${txtbld}$(tput setaf 6) #  cyan
txtrst=$(tput sgr0)             # Reset

echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""

# Get current path
DIR="$(cd `dirname $0`; pwd)"
OUT="$(readlink $DIR/out)"
[ -z "${OUT}" ] && OUT="${DIR}/out"

# Local defaults, can be overriden by environment
: ${PREFS_FROM_SOURCE:="false"}
if [ `uname -s` == "Darwin" ]; then
: ${THREADS:="$(sysctl -n machdep.cpu.core_count)"}
else
: ${THREADS:="$(cat /proc/cpuinfo | grep "^processor" | wc -l)"}
fi

# Import command line parameters
DEVICE="$1"

# Get build version
VERSION_BRANCH=$(cat $DIR/vendor/nexus/configs/version.mk | grep 'ROM_VERSION_BRANCH := *' | sed  's/ROM_VERSION_BRANCH := //g')
VERSION_BUILD=$(cat $DIR/vendor/nexus/configs/version.mk | grep 'ROM_VERSION_BUILD := *' | sed  's/ROM_VERSION_BUILD := //g')

VERSION=$VERSION_BRANCH-$VERSION_BUILD

# Get start time
res1=$(date +%s.%N)

echo -e "${cya}Building ${bldcya}AOSP-Nexus $VERSION for $DEVICE ${txtrst}";
echo -e "${bldgrn}Start time: $(date) ${txtrst}"

echo -e ""

export DEVICE=$DEVICE

# Setup environment
echo -e ""
echo -e "${bldblu}Setting up environment${txtrst}"
   . build/envsetup.sh
echo -e ""

# lunch/brunch device
echo -e "${bldblu}Lunching device [$DEVICE]"
   lunch "nexus_$DEVICE-userdebug";

echo -e "${bldblu}Starting compilation${txtrst}"
   mka bacon
echo -e ""

# Get elapsed time
   res2=$(date +%s.%N)
   echo -e "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds)${txtrst}"
