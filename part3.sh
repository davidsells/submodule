#!/bin/bash

CWD=${PWD}

#After resolving the merge conflict

cd app3/plugin

git add .
git commit -m "merged"

git push origin master
#git push origin master
#move up to app level
cd ..

#Commit is required before merge/rebase
git push
git add plugin
git commit -m "updated my submodule"
git push origin master

echo "Commiting locally"

#Now we want to update the application to reflect these changes.
#Since the submodule is a standalone repository we need to follow the
#standard check in procedures pulling the changes and rebase
#echo "merge off of origin"
#git merge origin master
#git commit -m "updated plugin from app"

#Move into the app directory
#cd ..

#Now that the plugin is update we can go into the app root and update
#To do this we need to again update init
#git submodule update -init
#git add .
#git commit -m "update app to reflect changes in submodule"

cd $CWD
cd app3
git push origin master

cd $CWD
#Let look at a clone of the application to insure that all the information
#is there
git clone ${CWD}/appRepo.git app4
cd app4
git submodule update --remote

