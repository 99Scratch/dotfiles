#!/bin/bash
sed 's/mp4/mp4\n/g' TEDTalks\ \(video\).xht > ted1
sed 's,http://,\nhttp://,g' ted1
sed 's,http://,\nhttp://,g' ted1 > ted2
grep mp4$ ted2 > mp4s
rm ted[1-2]

