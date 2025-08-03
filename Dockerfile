FROM alpine:latest

# Get apk packages
RUN apk add --update --no-cache cronie
RUN apk add --update --no-cache sshpass
RUN apk add --update --no-cache openssh
RUN apk add --update --no-cache curl
# Setup cron stuff
WORKDIR /app
COPY CronScripts/create-backup.sh /app/create-backup.sh
COPY CronScripts/delete-old-backups.sh /app/delete-old-backups.sh
COPY CronScripts/upload-backup.sh /app/upload-backup.sh
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/create-backup.sh /app/delete-old-backups.sh /app/upload-backup.sh /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]

# Set environment variables
ENV TZ=Etc/UTC

# Define volumes
VOLUME ["/radarrConfig", "/sonarrConfig", "/prowlarrConfig", "/bazarrConfig"] 