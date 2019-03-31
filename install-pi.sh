#!/usr/bin/env bash

set -exo pipefail

sudo /usr/bin/apt update
sudo /usr/bin/apt install --yes ansible git

git clone https://github.com/jhillyerd/pi-network-lab.git ~/pi-network-lab
cd ~/pi-network-lab
./apply.sh
