#!/bin/bash

BACKUP_DIR="backups"
RESTORE_DIR="company"
LOG_FILE="recovery.log"

# Find the latest backup file
LATEST_BACKUP=$(ls -t $BACKUP_DIR/backup_*.tar.gz | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] No backup file found." >> $LOG_FILE
    echo "No backup available for recovery."
    exit 1
fi

# Restore the deleted file
tar -xzf $LATEST_BACKUP -C . $RESTORE_DIR/HR/employee_list.txt 2>> $LOG_FILE

if [ $? -eq 0 ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Successfully recovered: $RESTORE_DIR/HR/employee_list.txt" >> $LOG_FILE
    echo "File recovered successfully."
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Failed to recover: $RESTORE_DIR/HR/employee_list.txt" >> $LOG_FILE
    echo "Recovery failed. Check $LOG_FILE for details."
fi

