#!/bin/bash
mount -t proc proc /mnt/proc
mount -t sysfs sys /mnt/sys
mount -o bind /dev /mnt/dev
chroot /mnt /bin/bash

