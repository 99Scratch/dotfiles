#! /bin/bash
# copyright c 2010 david kuehling.  gplv3.
m=16384; while true; do
(( x=m-RANDOM,y=m-RANDOM,k+=(x*x + y*y < m*m), i+=1, p=4*1000000*k/i))
sed -e 's/./&./'<<<"$p"
done
