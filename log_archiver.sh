#!/bin/bash
# ============================================================
# Script Name: log_archiver.sh
# Description: Locates and archives all log files that 
#              are older than 7 days. Any archived files that are
#              older than 30 days, will be deleted. 
# 
# Author:      Reginald Griffin II
# Date:        2026-05-15
# Usage:       sudo log_archiver.sh
# ============================================================
SOURCE_DIR="/var/log"
BACKUP_DIR="$HOME/log_backups"
DAYS_OLD=7
RETENTION_DAYS=30
set -euo pipefail

echo "=== Starting process to archive logs ==="

# Make the needed backup directory.
mkdir -p $BACKUP_DIR || {echo "ERROR: Cannot create backup directory."; exit 1;}

# Find needed log files and compress old logs.
find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS_OLD -exec gzip {} \;

# Move the compressed files to the backup dir to archive.
mv $SOURCE_DIR/*.gz $BACKUP_DIR/ 2>/dev/null

# Delete archives that are older than the retention period.
cd $BACKUP_DIR
find $BACKUP_DIR -name "*.gz" -type f -mtime +$RETENTION_DAYS -delete

echo "$(date): Archived logs older than $DAYS_OLD days. Cleared any backups older then $RETENTION_DAYS days." >> $BACKUP_DIR/archive.log

echo -e "------- Process Completed -------\\nCurrent Logs are listed in $BACKUP_DIR."
