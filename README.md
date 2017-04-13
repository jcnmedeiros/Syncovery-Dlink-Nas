Description
===========
Syncovery is a file synchronization and backup software. More information at https://www.syncovery.com/

Package
=======
This is the files, used to create a package ".apkg" for Dlink Nas.
More information on how to create a package, at http://ftp.dlink.ru/pub/NAS/DNS-327L/Add-on/ShareCenter%20Add-On%20SDK_v2.1_09052013.zip

Manual Installation
===================
If you don´t want to create a package, you can do a manual installation.
You need SSH access to NAS. New version of Dlink firmware has SSH access, but if you have an old version, you can install SSH package. You can find at http://dlink.vtverdohleb.org.ua/Add-On/

1. Connect to Nas using ssh
2. Copy these files to a folder to /tmp/Syncovery
3. Go to /tmp/Syncovery
4. Run ./install.sh
5. Synconvery Program will be installed on /mnt/HD/HD_a2/Nas_Prog/Syncovery
6. You can start program with /mnt/HD/HD_a2/Nas_Prog/Syncovery/start.sh
7. After restart the nas, the addon will appear, like a installed one. 
8. You can access web interface to create profiles and backup jobs
  URL: http://<ip address>:8999/index.html
  Username: default
  Password: pass
