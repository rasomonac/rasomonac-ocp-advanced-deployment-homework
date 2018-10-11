#!/usr/bin/env bash

echo "Copy a custom hosts file to /etc/ansible/hosts"
cp -a /root/ocp_advanced_deployment_homework/hosts /etc/ansible/hosts

echo "Set up the right GUID to generate the inventory - change mine to current users GUID"
GUID=`hostname|awk -F. '{print $2}'`
sed -i "s/68e1/$GUID/g" /etc/ansible/hosts
