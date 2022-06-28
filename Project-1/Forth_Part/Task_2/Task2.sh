#!/bin/bash
for i in {1..10}
do
   cat certificate.pem | cut -d'\' -f$i >> new.pem
done



