#!/bin/bash
# Automated-Hourly-Database-Backup


export PATH=/bin:/usr/bin:/usr/local/bin
FTP_UPLOAD_DIR="/Backup/"
DB_BACKUP_PATH='/'

# Adjust your Database Credential
# ###############################
MYSQL_HOST='localhost'
MYSQL_PORT='3306'
MYSQL_USER='root'
MYSQL_PASSWORD='Passw0rd'
DATABASE_NAME='database_name'

# Adjust your FTP Credential
# ###############################
FTP_SERVER="ftp_host_name"
FTP_USERNAME="ftp_login_name"
FTP_PASSWORD="ftp_login_password"

# Backup Procedure for Local Disk
####################################

TODAY=`date +"%d%b%Y--%H-%M"`
echo "Backup started for database - ${DATABASE_NAME}"

mysqldump -h ${MYSQL_HOST} \
   -P ${MYSQL_PORT} \
   -u ${MYSQL_USER} \
   -p${MYSQL_PASSWORD} \
   ${DATABASE_NAME} | gzip > ${DB_BACKUP_PATH}/${DATABASE_NAME}-${TODAY}.sql.gz

if [ $? -eq 0 ]; then
  echo "Database backup successfully completed"
else
  echo "Error found during backup"
  exit 1
fi

# End of Backup Procedure in Local Disk
########################################


# Now Upload the Backedup database file to FTP
###############################################

ftp -n $FTP_SERVER << EndFTP
user "$FTP_USERNAME" "$FTP_PASSWORD"
binary
hash
mkdir $FTP_UPLOAD_DIR
cd $FTP_UPLOAD_DIR
lcd $DB_BACKUP_PATH
put "${DATABASE_NAME}-${TODAY}.sql.gz"
bye
EndFTP

if test $? = 0
then
    echo "Database Successfully Uploaded to Ftp Server"
else
    echo "Error in database Upload to Ftp Server"
fi

# Now Delete the Local file 
rm -rf "${DATABASE_NAME}-${TODAY}.sql.gz"

############################################
################## END #####################
############################################
