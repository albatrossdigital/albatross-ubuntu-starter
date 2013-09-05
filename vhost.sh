#!/bin/bash
# This script is used to create virtual hosts.
echo "Enter your linux username"
read un
echo "Enter the home directory you want to use (should already be created: /home/$un/workspace/)"
read homedir
echo "Enter ServerName (domain name, microsoft.com, ubuntu.org"
read sn
echo "To install the site:"
echo "  drush site-install standard --db-url=mysql://root:pass@localhost/test --sites-subdir=$sn"
#echo "Enter ServerAdmin email"
#read se

# Create the web directory and a index.php test file
#mkdir $homedir
#cd $homedir
#mkdir $sn
#cd $homedir/$sn
#mkdir "public_html"
#cd $homedir/$sn/public_html
#echo "<?php echo '<h1>$2</h1>'; ?>" > $homedir/$sn/public_html/index.php

# Set the owner and change permissions
sudo chown -R $un:www-data $homedir/
#chown -R ftpuser:www-data $homedir/$sn/
##chmod -R '750' $homedir
#sudo chmod -R '750' $homedir/$sn/public_html


# Create a directory for your apache errors log
sudo mkdir /var/log/apache2/$sn/


# Creation the file with VirtualHost configuration in /etc/apache2/site-available/
sudo echo "
<VirtualHost *:80>
  ServerAdmin $un@localhost
  DocumentRoot "$homedir"
  ServerName $sn
  <Directory "$homedir">
    Options Indexes FollowSymLinks
    AllowOverride All
    Order allow,deny
    Allow from all
  </Directory>
  ErrorLog /var/log/apache2/$sn/error.log
  LogLevel warn
  CustomLog /var/log/apache2/$sn/access.log combined
  <IfModule mpm_peruser_module>
    ServerEnvironment apache apache
  </IfModule>
</VirtualHost>
" > /etc/apache2/sites-available/$sn


# Add the host to the hosts file
sudo echo 127.0.0.1 $sn >> /etc/hosts


# Enable the site
sudo a2ensite $sn

# Reload Apache2
sudo /etc/init.d/apache2 reload

