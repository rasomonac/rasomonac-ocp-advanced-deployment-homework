# https://docs.openshift.com/container-platform/3.9/install_config/install/advanced_install.html#uninstalling-advanced
# run uninstall playbook and delete all left over content from masters, nodes and NFS
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/adhoc/uninstall.yml
ansible nodes -a "rm -rf /etc/origin"
ansible nfs -a "rm -rf /srv/nfs/*"
