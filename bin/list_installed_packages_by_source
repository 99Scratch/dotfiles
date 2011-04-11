#!/bin/bash
for i in $(dpkg --get-selections | grep "\binstall" | awk '{print $1}'); 
do
	apt-cache madison $i | sed -e /updates/d -e /security/d -e /Sources/d -e s:maverick\/::g | awk '{ print $1 "   " $6 }' >> debs_file.txt; 
done
