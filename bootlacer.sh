#!/bin/bash
#  Bootlacer 1.0 by @Boxxa on Twitter and Github
#
#  I dont really care what you do with this script. I only ask you don't sell it or claim it
#  as your own. I only wrote it becuase I got lazy from loading bootstrap everytime and 
#  adding CDN links. After launching a project quickly for someone, they asked to share this.
#  
#  Script will download latest bootstrap version, create a project folder, and give you options to
#  create a base template and add a range of CDN script libraries into your page automatically. 
#
#  Again.... I am lazy and got sick of doing this.
# 
#  USAGE
#     -Set your directory below where you want all projects created under. Typical WWW root.
#     -Run script with your project name after it. Example: sh bootlacer.sh mynewproject
#     -The "mynewproject" folder will be created for you.
#     -YOu will have options to create a barebones page and add librarires
#  ADDITIONAL LIBRARIES
#     -JqueryUI		http://jqueryui.com
#     -Prototype	http://prototypejs.org/
#     -Chromeframe	http://developers.google.com/chrome/chrome-frame/
#     -AngularJS	http://angularjs.org/
#     -Modernizr	http://modernizr.com/
#     -Init.js		Quick document.ready() inclusion for quick jQuery scripting
#	 
#
#
# CHANGE THIS IF YOU WANT TO INSTALL FILES TO OTHER ROOT FOLDER THAN DEFAULT HTTP FOLDER
PROJ_DIR="/var/www/html/"
#
#
#
#
#
echo "Got swagger like us..."
if [ -z "$1" ]
	then
	 echo "You must specific a project folder to install to"
	 exit
fi
echo "\r\n\r\n"
echo "Fetching most recent Boostrap version from da GitHuz"
wget -O /tmp/bootstrap.zip http://twitter.github.com/bootstrap/assets/bootstrap.zip
unzip /tmp/bootstrap.zip
mkdir $PROJ_DIR$1
echo "Creating project: " $1
echo "Loading boostrap"
mv bootstrap/* $PROJ_DIR$1
rm -fR bootstrap/

read -p "Create barebones Bootstrap page?(y/n)?"
if [ $REPLY == "y" ]; then
	wget https://raw.github.com/boxxa/Bootlacer/master/barebones.html
else
	echo "All done."
	exit 1
fi

read -p "Do you want to start adding libraries to your page? (y/n)"
if [ $REPLY == "n" ]; then
	echo "  </body>" >> barebones.html
	echo "</html>" >> barebones.html
	mv barebones.html $PROJ_DIR$1"/index.html"
	echo "Created " $PROJ_DIR$1
	exit 1
fi
read -p "Add jQueryUI support? (y/n)"
if [ $REPLY == "y" ]; then
        echo "   <script src='//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js'></script>" >> barebones.html
	echo "Adding jQueryUI"
fi
read -p "Add Prototype support?(y/n)"
if [ $REPLY == "y" ]; then
       echo "    <script src='//ajax.googleapis.com/ajax/libs/prototype/1.7.1.0/prototype.js'></script>" >> barebones.html
	echo "Adding Prototype"
fi
read -p "Add Chromeframe support? (y/n)"
if [ $REPLY == "y" ]; then
        echo "   <script src='//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js'></script>" >> barebones.html
	echo "Adding Chromeframe" 
fi
read -p "Add AngularJS support? (y/n)"
if [ $REPLY == "y" ]; then
        echo "   <script src='//ajax.googleapis.com/ajax/libs/angularjs/1.0.2/angular.min.js'></script>" >> barebones.html
	echo "Adding AngularJS"
fi
read -p "Add Modernizr support? (y/n)"
if [ $REPLY == "y" ]; then
        echo "   <script src='//cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.1/modernizr.min.js'></script>" >> barebones.html 
	echo "Adding Modernizr"
fi
read -p "Add an init.js script for your jQuery data? (y/n)"
if [ $REPLY == "y" ]; then
        echo "   <script src='init.js'><script>" >> barebones.html
	touch $PROJ_DIR$1/init.js
	echo "Created init.js"
fi
echo "  </body>" >> barebones.html
echo "</html>" >> barebones.html
mv barebones.html $PROJ_DIR$1"/index.html"
echo "Created " $PROJ_DIR$1
#
if [ -z "$2" ]
        then
         echo "You must specific a project folder to install to"
         exit 1
fi
#
exit 1
