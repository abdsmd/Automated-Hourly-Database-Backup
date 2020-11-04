# Automated MySQL Database Backup

*For adding cronjjob you can check https://crontab.guru/*

for cronjob At every 30th minute.
```*/30 * * * * /backup.sh```

everyday ar midnight
```0 0 * * * /backup.sh```

every sunday
```0 0 * * 0 /backup.sh```
