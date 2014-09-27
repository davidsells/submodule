#!/bin/bash

CWD=${PWD}


cd $CWD
#Let look at a clone of the application to insure that all the information
#is there
git clone ${CWD}/appRepo.git app4
cd app4
git submodule update --init

#go into plugin to make it editable
cd plugin

git checkout master

#Back in the app update the commit pointer
cd ..
git add plugin
git commit -m "Update submodule tracking to the latest commit"
git push
cd $CWD




