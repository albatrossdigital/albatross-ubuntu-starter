albatross-ubuntu-starter
========================

All the software fit to develop websites.  A bash script to set up the dev enviornments for Albatross Digital on an clean Ubuntu (Linux Mint) OS. Includes LAMP for Drupal, node.js, sublime3 and more.


Installation
------------
Just run install.sh:
`sudo bash install.sh`

#### Manual steps:
Update in `/etc/php5/apache2/php.ini`:
```
memory_limit = 512M
upload_max_filesize = 100M
post_max_size = 100M
```

What's included
---------------
+ Sublime2
+ Plugins for Sublime2 for Drupal (https://github.com/phase2/sublime-drupal.git)
+ LAMP stack for Drupal
+ Drush for Drupal
+ MS Core Fonts
+ Wine (for Photoshop)
+ SASS and Compass
+ KeepassX for passwords
+ gcolor2 colorpicker
+ node.js
+ redis
+ mongo
+ meteor (node.js framework)
