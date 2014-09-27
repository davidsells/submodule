#!/bin/bash

CWD=${PWD}

#Here we will try to update the submodule repo and commit it along with the app
# note that the plugin is now behind one commit

#first we will clone the app do the submodule update init and 
#then change the plugin. Note to do this we need to update the plugin to HEAD
#if we don't we will not be able to properly commit the plugin.

git clone ${CWD}/appRepo.git app3
cd app3
git submodule update --init

cd plugin
git checkout master
echo "Change from app to plugin" >> plugin.txt

#Add plugin txt
echo "Adding plugin to staged"
git add plugin.txt
git commit -m "Commit changes to plugin from app"
git fetch
git merge origin/master
git push

#fix up app to reflect the new commit level
cd ..
git add plugin
git commit -m "New update submodule tracking"
git push
cd $CWD


# no conflict
#echo "======================================================================"
#echo " Now go to app3/plugin directory to fix problem.  User: git mergetool"
#echo "======================================================================"
