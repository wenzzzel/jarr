#!/bin/sh

# Put env variables into a file for the cron jobs to use
echo "RADARR_API_KEY=${RADARR_API_KEY}" > /app/env-vars.sh
echo "SONARR_API_KEY=${SONARR_API_KEY}" >> /app/env-vars.sh
echo "PROWLARR_API_KEY=${PROWLARR_API_KEY}" >> /app/env-vars.sh
echo "BAZARR_API_KEY=${BAZARR_API_KEY}" >> /app/env-vars.sh
echo "SFTP_SERVER=${SFTP_SERVER}" >> /app/env-vars.sh
echo "SFTP_USERNAME=${SFTP_USERNAME}" >> /app/env-vars.sh
echo "SFTP_PASSWORD=${SFTP_PASSWORD}" >> /app/env-vars.sh
chmod 600 /app/env-vars.sh

# Setup cron job that creates + uploads backups
# Note: Using random minutes (37, 23, 44) to minimize the risk of conflicts with other tasks
(crontab -l 2>/dev/null; echo "37 * * * * /app/create-backup.sh") | crontab -
(crontab -l 2>/dev/null; echo "23 0 * * * /app/delete-old-backups.sh") | crontab -
(crontab -l 2>/dev/null; echo "44 * * * * /app/upload-backup.sh") | crontab -

# Run cron in foreground
/usr/sbin/crond -f