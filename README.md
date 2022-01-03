## You Can Choose VPS from DigitalOcean
[![DigitalOcean Referral Badge](https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg)](https://www.digitalocean.com/?refcode=4ef7bcd8895a&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge)



## Automated MySQL Database Backup
![Automated MySQ LDatabase Backup Script](https://github.com/abdsmd/Automated-MySQL-Database-Backup-Script/raw/main/mysql-backup-to-ftp.png "Automated MySQ LDatabase Backup Script")

```
wget -O /backup.sh https://raw.githubusercontent.com/abdsmd/Automated-MySQL-Database-Backup-Script/main/backup.sh
chmod 777 /backup.sh
# To run immediate backup 
/backup.sh
```

**For adding cronjjob you can check https://crontab.guru/**

Cronjob at every 30th minute.
```*/30 * * * * /backup.sh```

Everyday ar midnight
```0 0 * * * /backup.sh```

Every sunday
```0 0 * * 0 /backup.sh```
