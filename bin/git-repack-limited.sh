#!/bin/bash
# http://www.deimeke.net/dirk/blog/index.php?/archives/3266-Git-Repositories-packen-....html

for i in *.git
do
        du -hsx ${i}
        cd ${i}
        nice -n 19 ionice -c 2 -n 7 git repack -a -d --depth=250 --window=250 --window-memory=512m
        cd ..
        du -hsx ${i}
        echo
done

