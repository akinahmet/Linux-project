#!/bin/bash

# Check if we are root privilage or not
if [[ "$UID" -ne 0 ]]
then
    echo "Root olarak giris yap!"
    exit 1
fi

# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file

backup_files="/home/ec2-user/data"
# Where do we backup to. Please crete this file before execute this script

if [ -z "$(ls /mnt/backup | grep $(date +%d-%b-%Y))" ]
then
    mkdir /mnt/backup/$(date +%d-%b-%Y)
    echo "$(date +%d-%b-%Y) folder is ready!"
else
    echo "$(date +%d-%b-%Y) folder already exists!"
fi

dest="/mnt/backup/$(date +%d-%b-%Y)"

# Create archive filename based on time

time=$(date +"%Y_%m_%d_%I_%M_%p")
hostname=$(hostname -s)
archive_file="${hostname}-${time}.tgz"

# Print start status message.
echo "We will back up ${backup_files} to ${dest}/${archive_file} "
date
echo

# Backup the files using tar.

tar czf ${dest}/${archive_file} ${backup_files}

# Print end status message.
echo
echo "Congrulations! Your Backup is ready"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest
weißes_häkchen
augen
erhobene_hände











