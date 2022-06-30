#!/bin/bash

# Check if we are root privilage or not
if [ `whoami` != 'root' ]
  then
    echo "You must be root to do this."
    exit
fi

# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file
# Or create data file
touch data

# Where do we backup to. Please crete this file before execute this script

mkdir /mnt/backup
dest="/mnt/backup"

# Create archive filename based on time
current="$(date +'%d_%b_%T')"  # day of month, month name, time
hostname=$(hostname)
archive_file="$hostname-$current.tgz"

# Print start status message.

echo "Backing up"

# Backup the files using tar.
tar czf /mnt/backup/$archive_file /home/ec2-user/data  
# c create, z zip, f file
# Print end status message.

echo "Backup finished"


# Long listing of files in $dest to check file sizes.

/mnt/backup

# crontab ==>  (5 * * * * ./backup.sh)