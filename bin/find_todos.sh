#!/bin/bash
find . -name "*.tex" -exec grep -inrH --color \\\\todo\{.*\} {} \;
echo "Counter:"
grep -irc \\\\todo\{.*\} * | grep -v :0$ | grep \.tex:
