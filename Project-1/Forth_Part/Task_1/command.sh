#!/bin/bash
privatIP=$(sed '20!d' info.json | awk -F\" '{print $4}')
sed "s/ec2-private_ip/$privatIP/" terraform.tf > terraform_new.tf  # s ile al, private_ip'yi bul sonra $privatIP'de degistir 

# alternative solutions
# cat info.json | grep "PrivateIPAddress" | head -1 | awk -F\" '{print $4}'
# sed i flag ile yerinde yazilabilir
# sed -i "s/ec2-private_ip/$privatIP/" terraform.tf  (mevcut dosyanin üzerine yazdik)