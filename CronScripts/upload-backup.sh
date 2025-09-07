#!/bin/sh

# Load environment variables
. /app/env-vars.sh



#RADARR
# Download the radarr-latest.zip backup and re-upload it with a timestamp in the name
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER:uploads/radarr/radarr-latest.zip radarr-latest.zip
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
put radarr-latest.zip uploads/radarr/radarr-$(date +"%Y%m%d%H%M").zip
EOF

# Upload the latest local backup to the ftp and call it radarr-latest.zip
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
put "../radarrConfig/Backups/manual/$(ls -t ../radarrConfig/Backups/manual/ | head -n 1)" uploads/radarr/radarr-latest.zip
EOF



#SONARR
# Download the sonarr-latest.zip backup and re-upload it with a timestamp in the name
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER:uploads/sonarr/sonarr-latest.zip sonarr-latest.zip
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
put sonarr-latest.zip uploads/sonarr/sonarr-$(date +"%Y%m%d%H%M").zip
EOF

# Upload the latest local backup to the ftp and call it sonarr-latest.zip
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
put "../sonarrConfig/Backups/manual/$(ls -t ../sonarrConfig/Backups/manual/ | head -n 1)" uploads/sonarr/sonarr-latest.zip
EOF



#PROWLARR
# Download the prowlarr-latest.zip backup and re-upload it with a timestamp in the name
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER:uploads/prowlarr/prowlarr-latest.zip prowlarr-latest.zip
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
put prowlarr-latest.zip uploads/prowlarr/prowlarr-$(date +"%Y%m%d%H%M").zip
EOF

# Upload the latest local backup to the ftp and call it prowlarr-latest.zip
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
put "../prowlarrConfig/Backups/manual/$(ls -t ../prowlarrConfig/Backups/manual/ | head -n 1)" uploads/prowlarr/prowlarr-latest.zip
EOF



#BAZARR
# Get the latest bazarr backup file
BAZARR_LATEST_FILE="../bazarrConfig/backup/$(ls -t ../bazarrConfig/backup/ | head -n 1)"

# Check if the backup file is larger than 100KB (102400 bytes)
if [ -f "$BAZARR_LATEST_FILE" ] && [ $(stat -c%s "$BAZARR_LATEST_FILE") -gt 102400 ]; then
    echo "Bazarr backup file is valid (larger than 100KB), proceeding with upload..."
    
    # Download the bazarr-latest.zip backup and re-upload it with a timestamp in the name
    sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER:uploads/bazarr/bazarr-latest.zip bazarr-latest.zip
    sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
put bazarr-latest.zip uploads/bazarr/bazarr-$(date +"%Y%m%d%H%M").zip
EOF

    # Upload the latest local backup to the ftp and call it bazarr-latest.zip
    sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
put "$BAZARR_LATEST_FILE" uploads/bazarr/bazarr-latest.zip
EOF
else
    echo "Bazarr backup file is too small (less than 100KB) or doesn't exist, skipping upload to prevent corruption..."
fi



#TDARR
# Download the tdarr-latest.zip backup and re-upload it with a timestamp in the name
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER:uploads/tdarr/tdarr-latest.zip tdarr-latest.zip
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
put tdarr-latest.zip uploads/tdarr/tdarr-$(date +"%Y%m%d%H%M").zip
EOF

# Upload the latest local backup to the ftp and call it tdarr-latest.zip
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
put "../tdarrConfig/Backups/$(ls -t ../tdarrConfig/Backups/ | head -n 1)" uploads/tdarr/tdarr-latest.zip
EOF



#QBITTORRENT
# Download the qbittorrent-latest.zip backup and re-upload it with a timestamp in the name
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER:uploads/qbittorrent/qbittorrent-latest.zip qbittorrent-latest.zip
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
put qbittorrent-latest.zip uploads/qbittorrent/qbittorrent-$(date +"%Y%m%d%H%M").zip
EOF

# Upload the latest local backup to the ftp and call it qbittorrent-latest.zip
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
put "../qbittorrentConfig/$(ls -t ../qbittorrentConfig/ | head -n 1)" uploads/qbittorrent/qbittorrent-latest.zip
EOF