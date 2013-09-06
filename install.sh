#!/bin/bash

###----------------------------------------###
###
###  Albatross Digital Ubuntu Dev Enviornment
###
###  Copyright (C) 2013 Albatross Digital
###  www.albatrossdigital.com
###
###  This program is free software. You can
###  redistribute it and/or modify it under
###  the terms of the GNU GPL as published by
###  the Free Software Foundation, version 2
###  or later.
###
###  This program is distributed in the hope
###  that it will be useful, but WITHOUT ANY
###  WARRANTY; without even the implied
###  warranty of MERCHANTABILITY or FITNESS
###  FOR A PARTICULAR PURPOSE. See the GNU GPL
###  for more details.
###
###  You should have received a copy of the
###  GNU GPL along with this program.
###  If not, see http://www.gnu.org/licenses/
###
###
###----------------------------------------###

###----------------------------------------###
### HOW-TO: run it with bash, not with sh  ###
###----------------------------------------###
###
### $ sudo bash ad-dev.sh
###

# git
sudo apt-get install -y git

# sublime
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer

# drupal sublime
git clone https://github.com/phase2/sublime-drupal.git
bash sublime-drupal/SublimeDrupal.sh

#chromium
sudo apt-get install -y chromium-browser

# LAMP with xdebug
sudo apt-get install -y apache2 php5-xdebug php5-dev php5-mysql php5-gd mysql-server libapache2-mod-php5 php5-curl php5-imagick php5-ffmpeg phpmyadmin php5-cli php5-mcrypt php5-imap php-pear
sudo a2enmod rewrite
sudo ln -s /usr/share/phpmyadmin /var/www/phpmyadmin
sudo service apache2 restart

# drush
pear channel-discover pear.drush.org
pear install drush/drush

#pythos - pandora player, http://kevinmehall.net/p/pithos/
#sudo add-apt-repository ppa:kevin-mehall/pithos-daily
#sudo apt-get update
#sudo apt-get install -y pithos

# virtualboxsudo add-apt-repository ppa:mozillateam/firefox-stable
#sudo apt-get install -y virtualbox-ose

# filezilla
sudo apt-get install -y filezilla

# ms core fonts
sudo apt-get install -y ttf-mscorefonts-installer

# sublime


# compass / sass, following http://ubuntulinuxhelp.com/installing-compass-on-ubuntu/
# if there are problems: https://ubuntulinuxhelp.com/installing-compass-on-ubuntu/?cid=4295
# fix from http://stackoverflow.com/questions/3653646/installing-compass
#sudo apt-get install -y ruby-full
#sudo apt-get install -y rubygems1.8
#sudo gem install compass
#sudo gem install compass --pre
#ln -s /var/lib/gems/1.8/bin/compass /usr/local/bin/compass

# also try:
#$ gem sources --add http://gems.github.com/
#$ sudo gem install chriseppstein-compass
#sudo apt-get install -y ruby-full
#sudo apt-get install -y rubygems1.8
#sudo gem install compass
#ln -s /var/lib/gems/1.8/bin/compass /usr/local/bin/compass
sudo apt-get install -y ruby-full
sudo apt-get install -y rubygems1.8
#sudo gem update --system
sudo gem install compass
sudo gem install sass
sudo gem install susy
sudo gem install compass-rgbapng

#wine for photoshop cs2, http://wiki.winehq.org/AdobePhotoshop
sudo apt-get install -y cabextract
sudo apt-get install -y wine
cd /tmp
wget http://kegel.com/wine/winetricks
sh winetricks corefonts vcrun6

# upgrade to firefox 4
#sudo add-apt-repository ppa:mozillateam/firefox-stable
#sudo apt-get update
#sudo apt-get upgrade

# keepassx - for passwords
sudo apt-get install -y keepassx

# gcolor2 color picker
sudo apt-get install -y gcolor2

# apache solr (running tomcat)
sudo apt-get install openjdk-6-jdk solr-tomcat

# insync (for Google Drive)
# this assumes you are using linux mint cinnamon
#sudo add-apt-repository ppa:gwendal-lebihan-dev/cinnamon-stable
#sudo apt-get update
#sudo apt-get install python-nemo
#wget -qO - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key \
#  | sudo apt-key add -
#sudo echo "deb http://apt.insynchq.com/mint nadia non-free" >> /etc/apt/sources.list
#sudo apt-get install insync-beta-cinnamon


# install latest node.js + redis + mongodb
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs redis-server mongodb


# install grunt and dependancies
npm install -g grunt
npm install -g grunt-cli
npm install

# meteor (node.js framework)
wget https://install.meteor.com -O meteor.sh
sudo bash meteor.sh

# Toggl client for timetracking
#sudo add-apt-repository ppa:official-toggl/ppa
#sudo apt-get update
#sudo apt-get install desktop-Toggl 


# set up workspace
mkdir ~/workspace
cp vhost.sh ~/workspace/vhost.sh


# msg
echo
echo
echo TESTING THAT COMPASS INSTALLED PROPERLY
echo "If there is an error below, try following the steps at https://ubuntulinuxhelp.com/installing-compass-on-ubuntu/?cid=4295"
compass -v
echo "To watch a compass project, type something like this:"
echo "  compass watch /var/aegir/platforms/dcpl/vufind/self_checkout --sass-dir sass --css-dir css --output-style nested --environment development --relative-assets"
echo
echo "All done running the script.  Now you just have to do a few things manually:"
echo "  install google chrome and set up sync, install voice & video chat"
echo "  install dropbox"
echo "  install photoshop"
echo "  install firefox extensions: firebug, user agent switcher, firesass, screen grabber"
echo
echo "To start tomcat and SOLR:"
echo "  Dropbox/Albatross Digital/Tutorials/ad-dev/local solr search api files to /usr/share/solr/conf"
echo "  sudo service tomcat6 start"
echo "  Accessible at http://localhost:8080/solr"
echo "  To set a custom port, sudo gedit /var/lib/tomcat6/conf/server.xml, search for 8080"
echo
echo "To install a new site:"
echo "  cd ~/workspace"
echo "  drush dl --drupal-project-rename=test"
echo "  cd test"
echo "  drush site-install standard --db-url=mysql://root:pass@localhost/test --sites-subdir=test.test"
echo "  sudo bash vhost.sh"



