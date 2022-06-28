#!/bin/bash
echo "invalid user list"
awk '/Invalid user/' auth.log | awk -F"]: " '{print $2}' | awk -F" " '{print $3}' | sort | uniq -c

