#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

__author__ = "strubbl"
__date__ ="$18.02.2011 10:36:49$"


if len(sys.argv) != 2:
    print "Usage: " + sys.argv[0] + " file_name"
    print "file_name - an url encoded as file name (via url2file_name.py)"
    sys.exit(1)
else:
    file_name = sys.argv[1]

url = file_name
url=url.replace("_colon_", ":")
url=url.replace("_slash_", "/")
url=url.replace("_qm_", "?")
url=url.replace("_amp_", "&")
url=url.replace("_equals_", "=")
url=url.replace("_percent_", "%")


print url
