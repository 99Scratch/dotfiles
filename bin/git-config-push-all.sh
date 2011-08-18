#!/bin/bash
if [ "$1" = "" ];
then
	dest="origin"
fi
git config --add remote.$dest.push '+refs/heads/*:refs/heads/*'
git config --add remote.$dest.push '+refs/tags/*:refs/tags/*'

