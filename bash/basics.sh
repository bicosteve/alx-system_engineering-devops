#!/bin/bash

# variable 
DIR="/path/to/dir"

if [-d "$DIR"]; then
    echo "Directory exists"
else
    echo "Directory does not exist"
fi

# Commands 
# key command: *grep: searches files for patterns and print matching lines 
grep -i "error" logfile.text 
# search for the word 'error' in a file ignoring the case


# awk -> versatile programming language for text processing
awk "{sum += $1} END {print sum}" numbers.txt
# calculates the sum of number in the first column

# sed -> a stream editor for filtering and transforming text 
sed "s/old/new/g" file.txt
# replaces all occurrences of 'old' with 'new' in the file

# Automation script
# can be used to automate routine tasks like backups, system monitoring etc

SOURCE="/path/to/source"
DEST="/path/to/destination"
DATE=$(date +%Y-%m-%d)
tar -czf "$DEST/backup-$DATE.tar.gz" "$SOURCE"
echo "Backup completed on $DATE" >> /var/log/backup.log



# Another example 
#!/bin/bash

SOURCE="/path/to/source"
DEST="/path/to/destination"
EMAIL="you@example.com"
DATE=$(date +%Y-%m-%d-%H%M)
LOGFILE="/var/log/backup.log"
BACKUP_FILE="$DEST/backup-$DATE.tar.gz"

# Create destination directory if it doesn't exist
if [ ! -d "$DEST" ]; then
  mkdir -p "$DEST"
  echo "[$(date)] Created destination directory: $DEST" >> "$LOGFILE"
fi

# Perform backup
if tar -czf "$BACKUP_FILE" "$SOURCE" 2>> "$LOGFILE"; then
  echo "[$(date)] Backup succeeded: $BACKUP_FILE" >> "$LOGFILE"
  echo -e "Backup was successful on $(date).\nBackup file: $BACKUP_FILE" | mail -s "✅ Backup Successful" "$EMAIL"
else
  echo "[$(date)] Backup failed" >> "$LOGFILE"
  echo -e "Backup failed on $(date).\nCheck $LOGFILE for details." | mail -s "❌ Backup Failed" "$EMAIL"
  exit 1
fi

# Rotate backups: delete files older than 1 day
find "$DEST" -type f -name "backup-*.tar.gz" -mtime +0 -exec rm -f {} \;
echo "[$(date)] Old backups cleaned from $DEST" >> "$LOGFILE"


# Commands
ps #--> returns type of shell 
date #--> returns today's date 
pwd #--> returns the working directory
ls #--> lists the content of the direcotry
ls -l #--> gives the long format of the content of the directory
echo #--> outputs value of a string or variable to the terminal.
echo "Hello, there"
