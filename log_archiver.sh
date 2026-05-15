#!/bin/bash

SOURCE_DIR="/var/log"
BACKUP_DIR="$HOME/log_backups"
DAYS_OLD=7
RETENTION_DAYS=30

echo "=== Starting process to archive logs ==="

# Make the needed backup directory.
mkdir -p $BACKUP_DIR

# Find needed log files and compress old logs.
find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS_OLD -exec gzip {} \;

# Move the compressed files to the backup dir to archive.
mv $SOURCE_DIR/*.gz $BACKUP_DIR/ 2>/dev/null

# Delete archives that are older than the retention period.
find $BACKUP_DIR -name "*.gz" -type f -mtime +$RETENTION_DAYS -delete

echo "$(date): Archived logs older than $DAYS_OLD days. Cleared any backups older then $RETENTION_DAYS days." >> $BACKUP_DIR/archive.log

echo -e "------- Process Completed -------\\nCurrent Logs are listed in $BACKUP_DIR."
