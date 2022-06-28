#!/bin/bash
privatIP=$(sed '20!d' info.json | awk -F\" '{print $4}')
sed "s/ec2-private_ip/$privatIP/" terraform.tf > terraform_new.tf