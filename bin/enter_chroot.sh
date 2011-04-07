#!/bin/bash
mount $1 $2
mount -o bind /dev $2/dev
mount -o bind /dev/shm $2/dev/shm
mount -o bind /proc $2/proc
mount -o bind /sys $2/sys
chroot $2
