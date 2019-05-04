# pi-network-lab

Configures a Raspberry Pi running Raspbian as a WiFi bridge with network
tooling.

## Installation

### Prerequisites

- Raspberry Pi 3 Model B (or B+), case, power supply
- 16GB or larger MicroSD card
- Raspbian Stretch with desktop (2018-11-13)

### Raspbian Setup

- Install Raspbian
  - via NOOBS (may be pre-installed if you bought a kit)
  - via imaging your SD card, I recommend [Balena Etcher]
- Boot your Pi, perform initial setup as prompted
  - Resize root partition and reboot
  - Configure keyboard locale, timezone
  - Set password for `pi` user
  - Connect to WiFi (this will be your internet connection)
  - Download OS updates and reboot

### pi-network-lab Install

Run the following commands:

```bash
wget https://raw.githubusercontent.com/jhillyerd/pi-network-lab/master/install-pi.sh
bash install-pi.sh
reboot
```

The `install-pi.sh` script will:

- Update apt package cache
- Install git and [ansible]
- Clone this repository from GitHub
- Run the [pi-network-lab playbook][site.yml] against localhost

## Updates

You can update to the latest version of pi-network-lab by running:

```bash
cd ~/pi-network-lab
git pull
./apply.sh
```

## Troubleshooting

- If you see any errors applying the playbook, it is safe to re-run `apply.sh`
  as listed in Updates above.
- If wireshark tells you that you do not have permission to run as non-root,
  try: `sudo dpkg-reconfigure wireshark-common` and answer yes to the question.

## Tips

Start a VNC server for remote desktop access:

```
tigervncserver -localhost no
```

Block traffic to an IP address:

```
sudo iptables -I FORWARD 1 -d 8.8.4.4 -j DROP
```

[ansible]:       https://www.ansible.com/
[Balena Etcher]: https://www.balena.io/etcher/
[site.yml]:      https://github.com/jhillyerd/pi-network-lab/blob/master/site.yml
