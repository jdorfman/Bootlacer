#!/bin/bash
#  Bootlacer 1.0 by @Boxxa on Twitter and Github
#
#  I dont really care what you do with this script. I only ask you don't sell it or claim it
#  as your own. I only wrote it becuase I got lazy from loading bootstrap everytime and 
#  adding CDN links. After launching a project quickly for someone, they asked to share this.
#  
#  Script will download latest bootstrap version, create a project folder, and give you options to
#  create a base template and add a range of CDN script libraries into your page automatically. 
#  Again.... I am lazy.
# 
#  USAGE
#     -Set your directory below where you want all projects created under. Typical WWW root.
#     -Run with minium requirements: sh bootlacer.sh <projectname>
#     -Project folder will be created for you and bootstrap will be enabled there.
#
#  ADDITIONAL LIBRARIES
#     -JqueryUI		http://jqueryui.com
#     -Prototype	http://prototypejs.org/
#     -Chromeframe	http://developers.google.com/chrome/chrome-frame/
#     -AngularJS	http://angularjs.org/
#     -Modernizr	http://modernizr.com/
#     -Init.js		Quick document.ready() inclusion for quick jQuery scripting
#	 
#  SUPPORTED TEMPLATES
#     -Very Basic       Minimum HTML tags for page
#     -Hero 		http://twitter.github.com/bootstrap/examples/hero.html
#     -Fluid		http://twitter.github.com/bootstrap/examples/fluid.html
#     -Starter		http://twitter.github.com/bootstrap/examples/starter-template.html
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
#
if [ -f /tmp/bootstrap.zip ]
then
#
unzip /tmp/bootstrap.zip
mkdir $PROJ_DIR$1
echo "Creating project: " $1
echo "Loading boostrap"
mv bootstrap/* $PROJ_DIR$1
rm -fR bootstrap/
echo "Basics are done for bootstrap. \r\nCreat a page template??\r\n1) Add Hero Template\r\n2)Add Fluid\r\n3)Add Starter\r\n4) Add bare bones?\r\n5) Exit"
read reponse
if ( "$response" == "1" )
 echo "Getting Hero..."
 wget http://twitter.github.com/bootstrap/examples/hero.html
 mv hero.html $PROJ_DIR$1
 break
elif ( "$response" == "2" )
 echo "Getting Hero..."
 wget http://twitter.github.com/bootstrap/examples/fluid.html
 mv hero.html $PROJ_DIR$1
 break
elif ( "$response" == "3" )
 echo "Getting Hero..."
 wget http://twitter.github.com/bootstrap/examples/starter-template.html
 mv hero.html $PROJ_DIR$1
 break
elif ( "$response" == "4" )
 echo "Writing bare bones template..."
 wget http://.html
 mv hero.html $PROJ_DIR$1
 break
elif ( "$response" == "5" )
 exit 1
else
 exit 1
fi

echo "Add any additional libararies to your page?"
read -p "Add any additional libararies to your page?(y/n)?"
if [ $REPLY != "y" ]; then
	echo "Exiting..."
	exit 1
fi
read -p "Add jQueryUI support? (y/n)"
if [ $REPLY == "y" ]; then
        echo "Added jQueryUI to " response
        break
fi
read -p "Add Prototype support?(y/n)"
if [ $REPLY == "y" ]; then
        echo "Added jQueryUI to " response
        break
fi
read -p "Add Chromeframe support? (y/n)"
if [ $REPLY == "y" ]; then
        echo "Added jQueryUI to " response
        break
fi
read -p "Add AngularJS support? (y/n)"
if [ $REPLY == "y" ]; then
        echo "Added jQueryUI to " response
        break
fi
read -p "Add Modernizr support? (y/n)"
if [ $REPLY == "y" ]; then
        echo "Added jQueryUI to " response
        break
fi




#
if [ -z "$2" ]
        then
         echo "You must specific a project folder to install to"
         exit 1
fi
#
else
 echo "Not able to get bootstrap file. Online?"
 exit 1
fi
exit 1
