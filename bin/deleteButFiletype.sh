#!/bin/bash
/usr/bin/find . ! -iregex .*\.$1 | /usr/bin/xargs rm
