#!/bin/bash
num=$(xmlstarlet sel --net -t -m "//user" -v "statuses_count" "http://identi.ca/api/users/show/${1}.xml")
pages=$((num / 200))
for page in $(seq 1 $((pages + 1)))
do
    xmlstarlet sel --net -t -m "//status" -v "created_at" -o " " -v "text" -n "http://identi.ca/api/statuses/user_timeline/${1}.xml?count=200&page=${page}"
    sleep 5
done


