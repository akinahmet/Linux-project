#!/bin/bash
echo "invalid user list"
awk '/Invalid user/' auth.log | awk -F"]: " '{print $2}' | awk -F" " '{print $3}' | sort | uniq -c

# alternative solutions
# grep -Eio "input_userauth_request: invalid user .+ " auth.log | awk '{print $4}' | sort | uniq -c > invalid_user.sh