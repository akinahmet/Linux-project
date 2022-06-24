#!/bin/bash

# head event_history.csv 
# tail event_history.csv 

content=$(awk -F, '/serdar/&&/TerminateInstance/ {print $10}' event_history.csv | awk -F: '{print $2}' | awk -F\" '{print $3}' | sort | uniq) 

echo "Instance ID's terminated by user 'serdar'" >> result.txt
echo "------------------" >> result.txt
for i in $content
do
    echo $i >> result.txt
done

