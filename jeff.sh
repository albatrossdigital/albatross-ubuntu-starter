# Setup mounting
# From http://askubuntu.com/questions/164926/how-to-make-hdds-mount-at-startup-in-ubuntu-12-04
sudo blkid # Get uuid
sudo nano /etc/fstab
UUID=fbbe988b-7c04-4c25-bcf4-21e4d27cc37c /media/shared ext4 sync,auto,rw 0 0
# Syntax: UUID=<uuid> <pathtomount> <file system> sync,auto,rw 0 0


rm -r ~/Downloads ~/Desktop ~/Documents
ln -s /media/shared/shared/Downloads ~/Downloads
ln -s /media/shared/shared/Desktop ~/Desktop
ln -s /media/shared/shared/Documents ~/Documents
ln -s /media/shared/shared/workspace ~/workspace
ln -s /media/shared/shared/Dropbox ~/Dropbox

sudo chown -R jeff:jeff /media/shared/shared