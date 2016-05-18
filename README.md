# backup-server-to-cloud
A script to save your websites or server configurations to the cloud
A french tutorial is available here : https://yann.me/sauvegarder-votre-serveur-dans-le-cloud-automatiquement/

# How to use

1. download the backup.sh file to /etc/cron.daily (to create backups every day)
2. rename backup.sh to backup_NAME.sh
3. give execution permissions to file : sudo chmod +x backup_NAME.sh
4. Modify the variables of the script

Don't forget to also change line 12 with the directory of your folder to backup.

At this point the script create a backup of your website or configuration every day and delete backups older than five days old. The backups are saved in /var/backups/files/.

# How to send to cloud
I use [Rclone][rclone] to synchronise my backup folder to my cloud folder.

1- You can install it with the commands :
```sh
wget http://downloads.rclone.org/rclone-v1.23-linux-amd64.zip
unzip rclone-v1.23-linux-amd64.zip
cd rclone-v1.23-linux-amd64
#copy binary file
sudo cp rclone /usr/sbin/
sudo chown root:root /usr/sbin/rclone
sudo chmod 755 /usr/sbin/rclone
#install manpage
sudo mkdir -p /usr/local/share/man/man1
sudo cp rclone.1 /usr/local/share/man/man1/
sudo mandb 
rm rclone-v1.23-linux-amd64.zip
```

2- Then you can use the [Rclone documentation][rclone-configuration] to configure a Cloud (google drive, amazon, dropbox, whatever is available)

3- You can create a cron task to sync your backup folder to your cloud folder, using a command similar to this one :
```sh
rclone sync local:/var/backups/files google_drive:my_cloud_backup
```

[rclone]: <http://rclone.org/>
[rclone-configuration]: <http://rclone.org/docs/>


