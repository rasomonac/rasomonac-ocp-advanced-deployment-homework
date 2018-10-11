#!/bin/bash
array=(amy andrew brian betty)
for user in "${array[@]}"; do 
#echo set password for $user
htpasswd -b /etc/origin/master/htpasswd $user r3dh4t1!;
done
