#!/bin/sh

# Load environment variables
. /app/env-vars.sh


#RADARR
# Step 1: List files in the remote directory
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF > remote_file_list.txt
ls -1 uploads/radarr/
EOF

# Step 2: Parse the list locally to determine which files are older than 3 days
file="remote_file_list.txt"
now=$(date -u +%Y%m%d%H%M)
temp_file=$(mktemp)
while IFS= read -r line; do
  if echo "$line" | grep -qE 'radarr-[0-9]{12}\.zip$'; then
      ts=$(echo "$line" | sed -nE 's/.*radarr-([0-9]{12})\.zip/\1/p')
      # Compare as integers; assumes timestamps are in UTC and increasing
      diff=$(( (10#$now - 10#$ts) ))
      if [ "$diff" -gt 7200 ]; then
          echo "$line" >> "$temp_file"
      fi
  fi
done < "$file"
mv "$temp_file" "$file"

# Step 3: Delete matching files from the remote server
for file in $(cat remote_file_list.txt); do
  sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
rm $file
EOF
done


#SONARR
# Step 1: List files in the remote directory
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF > remote_file_list.txt
ls -1 uploads/sonarr/
EOF

# Step 2: Parse the list locally to determine which files are older than 3 days
file="remote_file_list.txt"
now=$(date -u +%Y%m%d%H%M)
temp_file=$(mktemp)
while IFS= read -r line; do
  if echo "$line" | grep -qE 'sonarr-[0-9]{12}\.zip$'; then
      ts=$(echo "$line" | sed -nE 's/.*sonarr-([0-9]{12})\.zip/\1/p')
      # Compare as integers; assumes timestamps are in UTC and increasing
      diff=$(( (10#$now - 10#$ts) ))
      if [ "$diff" -gt 7200 ]; then
          echo "$line" >> "$temp_file"
      fi
  fi
done < "$file"
mv "$temp_file" "$file"

# Step 3: Delete matching files from the remote server
for file in $(cat remote_file_list.txt); do
  sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
rm $file
EOF
done


#PROWLARR
# Step 1: List files in the remote directory
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF > remote_file_list.txt
ls -1 uploads/prowlarr/
EOF

# Step 2: Parse the list locally to determine which files are older than 3 days
file="remote_file_list.txt"
now=$(date -u +%Y%m%d%H%M)
temp_file=$(mktemp)
while IFS= read -r line; do
  if echo "$line" | grep -qE 'prowlarr-[0-9]{12}\.zip$'; then
      ts=$(echo "$line" | sed -nE 's/.*prowlarr-([0-9]{12})\.zip/\1/p')
      # Compare as integers; assumes timestamps are in UTC and increasing
      diff=$(( (10#$now - 10#$ts) ))
      if [ "$diff" -gt 7200 ]; then
          echo "$line" >> "$temp_file"
      fi
  fi
done < "$file"
mv "$temp_file" "$file"

# Step 3: Delete matching files from the remote server
for file in $(cat remote_file_list.txt); do
  sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
rm $file
EOF
done


#BAZARR
# Step 1: List files in the remote directory
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF > remote_file_list.txt
ls -1 uploads/bazarr/
EOF

# Step 2: Parse the list locally to determine which files are older than 3 days
file="remote_file_list.txt"
now=$(date -u +%Y%m%d%H%M)
temp_file=$(mktemp)
while IFS= read -r line; do
  if echo "$line" | grep -qE 'bazarr-[0-9]{12}\.zip$'; then
      ts=$(echo "$line" | sed -nE 's/.*bazarr-([0-9]{12})\.zip/\1/p')
      # Compare as integers; assumes timestamps are in UTC and increasing
      diff=$(( (10#$now - 10#$ts) ))
      if [ "$diff" -gt 7200 ]; then
          echo "$line" >> "$temp_file"
      fi
  fi
done < "$file"
mv "$temp_file" "$file"

# Step 3: Delete matching files from the remote server
for file in $(cat remote_file_list.txt); do
  sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
rm $file
EOF
done


#TDARR
# Step 1: List files in the remote directory
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF > remote_file_list.txt
ls -1 uploads/tdarr/
EOF

# Step 2: Parse the list locally to determine which files are older than 3 days
file="remote_file_list.txt"
now=$(date -u +%Y%m%d%H%M)
temp_file=$(mktemp)
while IFS= read -r line; do
  if echo "$line" | grep -qE 'tdarr-[0-9]{12}\.zip$'; then
      ts=$(echo "$line" | sed -nE 's/.*tdarr-([0-9]{12})\.zip/\1/p')
      # Compare as integers; assumes timestamps are in UTC and increasing
      diff=$(( (10#$now - 10#$ts) ))
      if [ "$diff" -gt 7200 ]; then
          echo "$line" >> "$temp_file"
      fi
  fi
done < "$file"
mv "$temp_file" "$file"

# Step 3: Delete matching files from the remote server
for file in $(cat remote_file_list.txt); do
  sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
rm $file
EOF
done

#QBittorrent
# Step 1: List files in the remote directory
sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF > remote_file_list.txt
ls -1 uploads/qbittorrent/
EOF

# Step 2: Parse the list locally to determine which files are older than 3 days
file="remote_file_list.txt"
now=$(date -u +%Y%m%d%H%M)
temp_file=$(mktemp)
while IFS= read -r line; do
  if echo "$line" | grep -qE 'qbittorrent-[0-9]{12}\.zip$'; then
      ts=$(echo "$line" | sed -nE 's/.*qbittorrent-([0-9]{12})\.zip/\1/p')
      # Compare as integers; assumes timestamps are in UTC and increasing
      diff=$(( (10#$now - 10#$ts) ))
      if [ "$diff" -gt 7200 ]; then
          echo "$line" >> "$temp_file"
      fi
  fi
done < "$file"
mv "$temp_file" "$file"

# Step 3: Delete matching files from the remote server
for file in $(cat remote_file_list.txt); do
  sshpass -p "$SFTP_PASSWORD" sftp -o StrictHostKeyChecking=no "$SFTP_USERNAME"@$SFTP_SERVER <<EOF
rm $file
EOF
done