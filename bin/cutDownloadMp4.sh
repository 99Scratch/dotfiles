#!/bin/bash
tmppage=$(mktemp)
echo "temp file is $tmppage"
count=0

if [[ ( -n "$2" ) && ( $2 -gt 0 ) ]]; then
  echo "setting download rate to limit $2"
  ratelimit="--limit-rate=${2}k"
else
  ratelimit=""
fi

[ -f $1 ] || exit 1

while read p; do
  count=$(($count + 1))
  echo "###############################################"
  echo "processing $count $p"
  curl $p > $tmppage
  sed -i 's/mp4/mp4\n/g' $tmppage
  sed -i 's,http://,\nhttp://,g' $tmppage
  grep "^http.*\.mp4$" $tmppage | wget -c $ratelimit -i -
done < $1

