#!/bin/bash
echo "=== Health Check Report ==="
echo "Hostname: $(hostname)"
echo "IP: $(ip -4 addr show ens160 | grep inet | awk '{print $2}')"
echo "Uptime: $(uptime -p)"
echo "Memory:"
free -h
echo "Disk (/company):"
df -h /company
echo "SSH: $(systemctl is-active sshd)"
echo "Apache: $(systemctl is-active httpd)"
echo "Firewall: $(systemctl is-active firewalld)"
echo "SELinux: $(getenforce)"
