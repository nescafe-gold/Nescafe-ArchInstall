- [ ] First upload a manual install version that requires user input
- [ ] Make a version that has a config file 
- [ ] guided by dialog boxes and choosing along the way. It will automatically save the choices as a configuration file for you


* nodev - Do not interpret character or block special devices on the file system
- /var/tmp
- /var/log
- /var/cache
- /boot
* nosuid - Do not allow set-user-identifier or set-group-identifier bits to take effect
- /var/tmp
- /var/log
- /var/cache
- /boot
* noexec - Do not allow direct execution of any binaries on the mounted file system
- /var/tmp
- /var/log
- /var/cache
- /boot
* discard=async - Freed extents are not discarded immediately, but grouped together and trimmed later by a separate worker thread, improving commit latency
- All subvolumes
* compress-force=zstd - empirical testing on multiple mixed-use systems showed a significant improvement of about 10% disk compression from using compress-force=zstd over just compress=zstd (which also had 10% disk compression), resulting in a total effective disk space saving of 20%.
- All subvolumes
* noatime - The noatime option is known to improve performance of the filesystem. It also disables disk writes when a file is read, prolongin the lifespan of SSDs.
- All subvolumes
* commit - The resolution at which data are written to the filesystem is dictated by Btrfs itself and by system-wide settings. This means less writes (prolongs SSD lifespan) and better performance (multiple writes are combined into one single larger write, updates to previous writes within the commit time frame are cancelled out).
- All subvolumes
* space_cache - Btrfs stores the free space data ondisk to make the caching of a block group much quicker.
- All subvolumes
* autodefrag – will detect random writes into existing files and kick off background defragging. It is well suited to bdb or sqlite databases, but not virtualization images or big databases (yet). Once the developers make sure it doesn’t defrag files over and over again, they’ll move this toward the default
- All subvolumes
ssd - tells btrfs to use SSD Specific options
- All subvolumes

