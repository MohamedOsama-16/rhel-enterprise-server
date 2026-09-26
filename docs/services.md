# Services

## Apache/httpd
Installed via a local repo (system wasn't registered with
Red Hat's subscription servers, so I mounted the installation
ISO and used --repofrompath against BaseOS and AppStream instead).
Enabled and started with systemctl enable --now httpd. Verified
locally with curl on RHEL, then confirmed externally with curl
from the Ubuntu client — that external check is what actually
proves the whole chain works (package, service, port, firewall,
SELinux, client access), not just a local test.

## systemd
Used systemctl start/stop/restart/status/enable/disable throughout
the project for sshd, httpd, firewalld, and crond. Key distinction:
start runs a service now but won't survive a reboot; enable makes
it start automatically on boot but doesn't start it immediately —
enable --now does both.

## Simulated an Apache outage
Stopped httpd manually, confirmed curl failed to connect, checked
systemctl status to see it was inactive (dead), started it again,
and verified curl worked — a basic but realistic service-down
scenario.
