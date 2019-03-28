#!/bin/sh

ansible-playbook --become --inventory=hosts.txt --user=pi site.yml
