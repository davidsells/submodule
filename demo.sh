#!/bin/bash

CWD=${PWD}

#-------------------------------------------
echo " bare pluginRepo.git #################"
#-------------------------------------------
git init --bare pluginRepo.git
echo "PluginRepo.git Setup"

#-------------------------------------------
echo " bare appRepo.git #################"
#-------------------------------------------
git init --bare appRepo.git

echo "AppRepo.git Setup"


#-------------------------------------------
echo " plugin #################"
#-------------------------------------------
git init plugin
cd plugin
echo "Plugin Txt" > plugin.txt
git add plugin.txt
git commit -m "Plugin Initialization"
git remote add origin ../pluginRepo.git
echo "added plugin Repo.git"
git push origin master
cd ..

echo "Plugin Created"

#-------------------------------------------
echo" Create app1 ###################"
#-------------------------------------------
git init app1
cd app1
echo "App1 Txt" > app1.txt
git add app1.txt
git commit -m "App1 Initialization"
echo "Initialize App1"

git submodule add ${CWD}/pluginRepo.git plugin

echo "-------------------------------------------"
echo "Added submodule App1"
echo "-------------------------------------------"
git submodule init
git submodule update
git add .
git commit -m "App1 submodule add"
#git commit ./plugin
git remote add origin ${CWD}/appRepo.git
git push origin master
cd ..

echo "-------------------------------------------"
echo " Now change the plugin #######"
echo "-------------------------------------------"
cd plugin
echo "Appended to plugin" >> plugin.txt
git add plugin.txt
git commit -m "Plugin Initialization"
echo "added plugin Repo.git"
git push origin master
cd ..

echo "-------------------------------------------"
echo " app2 ###################"
echo "-------------------------------------------"
git clone ${CWD}/appRepo.git app2
cd app2
git submodule init
git submodule update
cd ..



echo "-------------------------------------------"
echo " Checkout latest plugin"
echo "-------------------------------------------"
git clone ${CWD}/pluginRepo.git pluginClone





