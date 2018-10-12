#!/usr/bin/sh
# https://www.opentlc.com/labs/ocp_advanced_deployment/03_1_Networking_Solution_Lab.html#labexercises

export GUID=`hostname | cut -d"." -f2`

array=(amy andrew brian betty)
for user in "${array[@]}"; do 
ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd' $user 'r3dh4t1!'
done

#ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd amy r3dh4t1!'
#ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd andrew r3dh4t1!'
#ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd brian r3dh4t1!'
#ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd betty r3dh4t1!'

oc adm groups new alpha amy andrew
oc adm groups new beta brian betty

for OCP_USERNAME in "${array[@]}"; do
oc create clusterquota clusterquota-$OCP_USERNAME \
 --project-annotation-selector=openshift.io/requester=$OCP_USERNAME \
 --hard pods=25 \
 --hard requests.memory=6Gi \
 --hard requests.cpu=5 \
 --hard limits.cpu=25  \
 --hard limits.memory=40Gi \
 --hard configmaps=25 \
 --hard persistentvolumeclaims=25  \
 --hard services=25
done

pwd=`pwd`
export pwd=$pwd/template/template.yml
echo "Create template from ${pwd}"
oc create -f $pwd

ansible masters -m shell -a "sed -i 's/projectRequestTemplate.*/projectRequestTemplate\: \"default\/project-request\"/g' /etc/origin/master/master-config.yaml"
ansible masters -m shell -a'systemctl restart atomic-openshift-master-api'
ansible masters -m shell -a'systemctl restart atomic-openshift-master-controllers'
