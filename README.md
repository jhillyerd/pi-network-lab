# pi-network-lab
Configures a Pi as a WiFi bridge with network tooling

## Tips

Start a VNC server for remote desktop access:

```
tigervncserver -localhost no
```

Block traffic to an IP address:

```
sudo iptables -I FORWARD 1 -d 8.8.4.4 -j DROP
```
