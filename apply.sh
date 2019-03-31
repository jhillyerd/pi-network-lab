#!/usr/bin/env bash
# usage:
#   apply.sh [remote IP]
#
# if no remote IP is specified, will run ansible against localhost

inventory=$(mktemp)

echo "[pi-network-lab]" > "$inventory"
if [ "$1" == "" ]; then
  echo "localhost ansible_connection=local" >> "$inventory"
else
  echo "$1" >> "$inventory"
fi

echo "### Host inventory configuration"
cat "$inventory"

ansible-playbook --become --inventory="$inventory" --user=pi site.yml

rm -f "$inventory"
