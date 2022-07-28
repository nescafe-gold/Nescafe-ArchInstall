# Arch Linux install script

This script aims to install Arch Linux using a script. The script can either run interactively or it can be run without user input through the use of variables inside the script. Eventually I plan on creating a config file instead but this will do for now.

If you leave some of the variables blank then it will prompt you for the information at the start so that once all the user choice i out of the way, it can be left to install without any user input.

This script does the following:
* USES EFI not BIOS
* Encrypts your system using secure defaults
* Uses booster instead of makeinitcpio (this is the initramfs)
* Uses the BTRFS filesystem 
- Optimised mount settings (optimized for IO, storage, and drive lifespan) SSD ONLY SO FAR
- Snapshots on install, Pre/Post package install/uninstall/update, and daily. This produces a lot of snapshots so I setup a service that clears old ones.
* Uses rEFInd as the bootloader (replacement for grub). 
* Uses a custom theme for rEFInd. I haven't settled on a theme yet, I chose a random one to test
* Uses chrony to sync up NTP information (This is the best for laptops)

## Default Variable Options
To choose your options before the script runs, all you need to do is open the script and edit the variables. Here are the default values of the script that can be changed:

### Locale Options
As you can see, the default keyboard layout and locales are set to UK. You can change these to whatever you want and if they are left blank (for example KEYMAP="") then the script will prompt you for the information and show you the options to choose from.
* KEYMAP="uk"
* LOCALE="en_GB.UTF-8"

### Hostname and Timezone
The default value of the HOSTNAME variable is blank. Therefore, if left blank, it will prompt you to enter a hostname.
* HOSTNAME=""

The default "TIMEZONE" variable is set to UK. This variable can not be empty like the ones previously mentioned, as I haven't added that functionality to prompt for the information yet. When I get around to it, I will add the option to choose and it will show all of the timezones available. 
* TIMEZONE="Europe/London"

The NTP variable doesn't do anything yet. When it is working, you will be able to choose whether you want to use NTP or not by setting the variable to true or false
NTP="TRUE"

### Disk Information
The DISK variable is where you select the disk you wish to install arch linux on. If left blank, the script will show you all of the storage devices connected to your system and give you a choice.
* DISK=""

Both of these variables give you the option to choose the label of the partitions. These variables cannot be left blank as I haven't added the functionality to prompt for the information yet. 
* EFI_LABEL="EFI"
* ENCRYPTED_BTRFS_VOLUMES_LABEL="CRYPTSYTEM"

### Encryption Information
These are the options that are passed to LUKS when encrypting the system partition
* ENCRYPTION_OPTIONS="--perf-no_read_workqueue --perf-no_write_workqueue --type luks2 --cipher aes-xts-plain64 --key-size 512 --iter-time 2000 --pbkdf argon2id --hash sha3-512"

The ENCRYPTION_PASSWORD variable is where you choose your encryption password. If this is left blank then it will prompt you for a password.
* ENCRYPTION_PASSWORD=""

* The ENCRYPTION_ENABLED variable doesn't do anything yet because I haven't added the functionality. When it is working, you will be able to choose whether you want to encrypt the root partition or not by choosing true or false.
* ENCRYPTION_ENABLED="TRUE"

### User Account Information
The three variables below allow you to select the username, user password, and the root account password. If any of these are left blank then the script will prompt you for the information.

USER_NAME=""
USER_PASSWORD=""
ROOT_PASSWORD=""

### Adding Extra Pacman Repositories 
These 2 variables give you the option to choose whether you want to add the multilib and blackarch repo to your Pacman config.

To choose you just set the variable to true or false. They can also be left blank in order for the script to prompt you.

By default I have enabled the multilib repo but not the blackarch repo because you may not want it added.
ENABLE_BLACKARCH=""
ENABLE_MULTILIB="TRUE"

### CPU Frequency Tuning
This variable lets you choose whether you want your CPU clock speed to be tuned. Tuning the frequency saves laptop battery because the CPU only runs at the speed required at the time. 

I have kept this variable blank so that you can decide for yourself. If it is left blank then the script will prompt you for a yes or no. You can also set this variable to true or false to enable or disable CPU clock speed tuning.
AUTOCPUFREQ=""


## Variables that can be left blank

This section is a summary of all the variables that you can leave blank. If they are left blank then it will prompt you for the information. My end goal is to be able to leave all of the variables blank so that you can either do a completely automated or completely guided install.

This list will change as the script is being developed.
* KEYMAP
* LOCALE
* HOSTNAME
* DISK
* ENCRYPTION_PASSWORD
* USER_NAME
* USER_PASSWORD
* ROOT_PASSWORD
* ENABLE_BLACKARCH
* ENABLE_MULTILIB
* AUTOCPUFREQ
