# pi-network-lab

Configures a Raspberry Pi running Raspbian as a WiFi bridge with network
tooling.

## Installation

The `install-pi.sh` script will:

- Update apt package cache
- Install git and [ansible]
- Clone this repository from GitHub
- Run the [pi-network-lab playbook][site.yml] against localhost

### Install commands

```bash
wget https://raw.githubusercontent.com/jhillyerd/pi-network-lab/master/install-pi.sh

./install-pi.sh
```

## Tips

Start a VNC server for remote desktop access:

```
tigervncserver -localhost no
```

Block traffic to an IP address:

```
sudo iptables -I FORWARD 1 -d 8.8.4.4 -j DROP
```

[ansible]:  https://www.ansible.com/
[site.yml]: https://github.com/jhillyerd/pi-network-lab/blob/master/site.yml
