#!/bin/bash
# Please before executing be sure that you are root user
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.
if [ `whoami` != 'root' ]
  then
    echo "You must be root to do this."
    exit
fi

# Get the username (login).

read -p "Please enter user name: " username
# Get the real name (contents for the description field).

read -p "Please enter real name: " realname
# Get the password.

read -s -p "Please enter new user  password: " userpass

# Create the account.

useradd -m  $username 
# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.
if [[ $? -eq 0 ]] ;
then
    echo "Account created"
else
    echo "Account not created"
fi

# Set the password.
echo $userpass | passwd $username --stdin

# Check to see if the passwd command succeeded.

if [[ $? -eq 0 ]] ;
then
    echo "password created for $realname"
else
    echo "Password  not created"
fi
# Force password change on first login.


# Display the username, password, and the host where the user was created.
echo "User name is : $username"
echo "Password is : $userpass" 
echo "Host for this user is $(getent passwd $username | cut -d: -f6)" 

