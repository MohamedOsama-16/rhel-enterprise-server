# Troubleshooting Scenarios

## 1. Network connectivity (Ubuntu → RHEL ping failing)
See docs/networking.md — root cause was a typo in the ping command,
found by ruling out firewalld, ufw, and SELinux first, then using
tcpdump to see traffic wasn't arriving at all.

## 2. Apache 403 Forbidden after changing DocumentRoot
See docs/security.md — root cause was a missing explicit <Directory>
block in Apache config, found after ruling out permissions and
SELinux context.

## 3. Disk space check
Verified df -h and du -sh as the standard approach: df to see which
filesystem is full, du to find which directory is actually
consuming the space, before deciding to delete/archive/extend.

## 4. Apache service down
Stopped httpd manually, confirmed the failure with curl, diagnosed
with systemctl status, restarted, and verified recovery.

## General approach used across all of these
Problem → check the logs/status first → rule out the obvious layers
one at a time → use a diagnostic tool (tcpdump, ausearch, ls -lZ)
to see the actual behavior instead of guessing → fix → verify.
