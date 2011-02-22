#!/bin/sh
dpkg --get-selections | awk '!/deinstall|purge|hold/ {print $1 " " $2}'
