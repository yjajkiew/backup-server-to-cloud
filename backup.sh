#!/bin/sh
 
THESITE="WEBSITE_NAME"
THEDB="WEBSITE_DB"
 
THEDBUSER="DB_USER"
THEDBPW="DB_PASSWORD"
THEDATE=`date +%d%m%y%H%M`

mysqldump -u $THEDBUSER -p${THEDBPW} $THEDB | gzip > /var/backups/files/dbbackup_${THEDB}_${THEDATE}.bak.gz
 
tar -czf /var/backups/files/sitebackup_${THESITE}_${THEDATE}.tar /var/www/vhost/$THESITE
gzip /var/backups/files/sitebackup_${THESITE}_${THEDATE}.tar
 
find /var/backups/files/site* -mtime +5 -exec rm {} \;
find /var/backups/files/db* -mtime +5 -exec rm {} \;
