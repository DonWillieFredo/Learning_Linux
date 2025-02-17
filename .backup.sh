#!/bin/bash

BACKUP_DIR="backups"
SOURCE_DIR="company"
DATE=$(date '+%Y-%m-%d')
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# Ensure the backup directory exists
mkdir -p $BACKUP_DIR

# Create the backup
tar -czf $BACKUP_FILE $SOURCE_DIR

# Log the backup process
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup created: $BACKUP_FILE" >> backup.log

echo "Backup completed. File: $BACKUP_FILE"

