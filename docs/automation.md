# Automation

## health-check.sh
A bash script that checks hostname, IP, uptime, memory, disk usage
on /company, and the status of sshd, httpd, firewalld, and SELinux
in one report. Uses command substitution ($(...)) to embed live
command output directly in the printed report.

## Cron
Scheduled health-check.sh to run every hour via crontab. Verified
crond was active and the job was registered with crontab -l. Output
is appended to a log file so history isn't lost between runs.
