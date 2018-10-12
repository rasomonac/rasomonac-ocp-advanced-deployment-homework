#!/usr/bin/sh

sed -i -e 's/\r$//' ./scripts/add-users.sh
sed -i -e 's/\r$//' ./scripts/create_pvs.sh
sed -i -e 's/\r$//' ./scripts/generate_inventory.sh
sed -i -e 's/\r$//' ./scripts/multitenancy.sh
sed -i -e 's/\r$//' ./scripts/pvs_large.sh
sed -i -e 's/\r$//' ./scripts/pvs_small.sh
sed -i -e 's/\r$//' ./scripts/uninstall.sh