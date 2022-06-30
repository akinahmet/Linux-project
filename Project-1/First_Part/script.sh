#!/bin/bash

# head event_history.csv 
# tail event_history.csv 

content=$(awk -F, '/serdar/&&/TerminateInstance/ {print $10}' event_history.csv | awk -F: '{print $2}' | awk -F\" '{print $3}' | sort | uniq) 
# Alternative solutions
# cat event_history.csv | grep -i serdar | grep -i TerminateInstance | grep -Eo "i-[a-zA-Z0-9]{17}" | sort | uniq
# grep -Eo (o:only)
# grep ile yapilan sonuc daha dogru


echo "Instance ID's terminated by user 'serdar'" >> result.txt
echo "------------------" >> result.txt
for i in $content
do
    echo $i >> result.txt
done

