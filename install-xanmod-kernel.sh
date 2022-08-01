#!/bin/bash
#set -e
##################################################################################################################
# Author 	: Erik Dubois
# Website   : https://www.erikdubois.be
# Website	: https://www.arcolinux.info
# Website	: https://www.arcolinux.com
# Website	: https://www.arcolinuxd.com
# Website	: https://www.arcolinuxb.com
# Website	: https://www.arcolinuxiso.com
# Website	: https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo
tput setaf 2
echo "################################################################"
echo "################### modprobed-db to install"
echo "################################################################"
tput sgr0
echo

#https://wiki.archlinux.org/title/Modprobed-db

sudo pacman -S modprobed-db --noconfirm --needed
modprobed-db
modprobed-db store
systemctl --user enable --now modprobed-db.service

echo
tput setaf 2
echo "################################################################"
echo "################### modprobed-db installed"
echo "################################################################"
tput sgr0
echo


#!/bin/bash
#set -e
##################################################################################################################
# Author 	: Erik Dubois
# Website   : https://www.erikdubois.be
# Website	: https://www.arcolinux.info
# Website	: https://www.arcolinux.com
# Website	: https://www.arcolinuxd.com
# Website	: https://www.arcolinuxb.com
# Website	: https://www.arcolinuxiso.com
# Website	: https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo
tput setaf 2
echo "################################################################"
echo "################### Start - Skylake cpu"
echo "################################################################"
tput sgr0
echo

#https://wiki.archlinux.org/title/Modprobed-db

wget https://aur.archlinux.org/cgit/aur.git/snapshot/linux-xanmod-tt.tar.gz

tar xzf linux-xanmod-tt*

rm linux-xanmod-tt.tar.gz

FIND="_microarchitecture=0"
REPLACE="_microarchitecture=98"
sed -i "s/$FIND/$REPLACE/g" linux-xanmod-tt/PKGBUILD

# FIND="use_numa=y"
# REPLACE="use_numa=n"
# sed -i "s/$FIND/$REPLACE/g" linux-xanmod-tt/PKGBUILD

# FIND="use_tracers=y"
# REPLACE="use_tracers=n"
# sed -i "s/$FIND/$REPLACE/g" linux-xanmod-tt/PKGBUILD

# FIND="_compiler=gcc"
# REPLACE="_compiler=gcc"
# sed -i "s/$FIND/$REPLACE/g" linux-xanmod-tt/PKGBUILD

# FIND="_compress_modules=n"
# REPLACE="_compress_modules=n"
# sed -i "s/$FIND/$REPLACE/g" linux-xanmod-tt/PKGBUILD

FIND="_localmodcfg=n"
REPLACE="_localmodcfg=y"
sed -i "s/$FIND/$REPLACE/g" linux-xanmod-tt-tt/PKGBUILD

cd linux-xanmod-tt

makepkg -s --skippgpcheck

cd $HOME 
rm -r $HOME/linux-xanmod-tt

echo
tput setaf 2
echo "################################################################"
echo "################### Stop"
echo "################################################################"
tput sgr0
echo
