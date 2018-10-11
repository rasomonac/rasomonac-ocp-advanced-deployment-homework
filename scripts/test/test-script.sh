# ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd amy r3dh4t1!'
#!/bin/bash
array=(amy andrew brian betty)
for user in "${array[@]}"; do 
echo ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd' $user 'r3dh4t1!'
done
