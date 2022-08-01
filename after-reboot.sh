#!/bin/bash

USERNAME="$(whoami)"

package=auto-cpufreq
if pacman -Qs $package > /dev/null ; then
    sudo systemctl enable --now auto-cpufreq
fi 

sudo umount /.snapshots
sudo rm -r /.snapshots
sudo snapper -c root create-config / 
sudo mount -a
sudo chmod 750 -R /.snapshots
sudo chmod a+rx /.snapshots
sudo chown :wheel /.snapshots

sudo snapper -c root create --description "Fresh Install" 

sudo sed -i 's/^TIMELINE_MIN_AGE.*/TIMELINE_MIN_AGE="1800"/' /etc/snapper/configs/root 
sudo sed -i 's/^TIMELINE_LIMIT_HOURLY.*/TIMELINE_LIMIT_HOURLY="0"/' /etc/snapper/configs/root 
sudo sed -i 's/^TIMELINE_LIMIT_DAILY.*/TIMELINE_LIMIT_DAILY="7"/' /etc/snapper/configs/root 
sudo sed -i 's/^TIMELINE_LIMIT_WEEKLY.*/TIMELINE_LIMIT_WEEKLY="0"/' /etc/snapper/configs/root 
sudo sed -i 's/^TIMELINE_LIMIT_MONTHLY.*/TIMELINE_LIMIT_MONTHLY="0"/' /etc/snapper/configs/root 
sudo sed -i 's/^TIMELINE_LIMIT_YEARLY.*/TIMELINE_LIMIT_YEARLY="0"/' /etc/snapper/configs/root

sudo systemctl enable --now snapper-timeline.timer snapper-cleanup.timer
sudo systemctl disable NetworkManager-wait-online
sudo systemctl mask NetworkManager-wait-online
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now NetworkManager-dispatcher
sudo systemctl enable --now nftables
sudo systemctl enable --now sshd

package=chrony
if pacman -Qs $package > /dev/null ; then
    sudo systemctl enable --now chronyd 
else
    sudo systemctl disable --now systemd-timesyncd.service
fi 

sudo systemctl enable --now reflector
sudo systemctl enable --now apparmor 
sudo systemctl enable --now sshguard 
sudo systemctl enable --now memavaild 
sudo systemctl enable --now irqbalance 
sudo systemctl enable --now prelockd
sudo systemctl enable --now nohang-desktop
sudo systemctl enable --now dbus-broker
sudo systemctl enable --now refind-btrfs

# Reconfigure sudo, so that a password is need to elevate privileges.
sudo sed -i '/^# %wheel ALL=(ALL) ALL/s/# //' /etc/sudoers # Uncomment line with sed
sudo sed -i '/^%wheel ALL=(ALL) NOPASSWD: ALL/s/^/# /' /etc/sudoers # Comment line with sed
