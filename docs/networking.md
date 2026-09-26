# Networking

## Setup
- RHEL server has two network adapters: NAT (internet access) and
  a Host-only adapter for direct communication with a second VM
- A separate Ubuntu VM was added as a real external client, with the
  same Host-only network, so I could test connectivity against an
  actual second machine instead of just localhost

## A real problem I had to debug
Ping from Ubuntu to RHEL was failing while the reverse direction
worked fine. I checked firewalld on RHEL (not blocking ICMP), ufw on
Ubuntu (inactive), and SELinux (no denials) — all ruled out. Used
tcpdump on RHEL while pinging from Ubuntu and saw no traffic arriving
at all, which pointed to the actual issue: a typo in the ping command
itself (-c with no number). Fixed the command, traffic showed up
immediately in tcpdump, ping worked.

## Commands used
ip addr, ip route, nmcli, ping, tcpdump, firewall-cmd
