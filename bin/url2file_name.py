#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

__author__ = "strubbl"
__date__ = "$18.02.2011 10:16:49$"


if len(sys.argv) != 2:
    print "Usage: " + sys.argv[0] + " url"
    print "url - http address"
    sys.exit(1)
else:
    url = sys.argv[1]

file_name = url

file_name=file_name.replace("http://www.", "")
file_name=file_name.replace("https://www.", "")
file_name=file_name.replace("http://", "")
file_name=file_name.replace("https://", "")
file_name=file_name.replace(":", "_colon_")
file_name=file_name.replace("/", "_slash_")
file_name=file_name.replace("?", "_qm_")
file_name=file_name.replace("&", "_amp_")
file_name=file_name.replace("=", "_equals_")
file_name=file_name.replace("%", "_percent_")


print file_name
