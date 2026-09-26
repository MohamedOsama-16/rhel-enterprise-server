# Changelog

## Initial build
- RHEL 10 server deployed and configured (hostname, network verified)
- LVM storage set up for /company (PV → VG → LV → XFS → fstab)
- Company directory structure and users/groups/permissions/ACL
- Storage expanded live (10GB → 13GB)
- Second network + Ubuntu client added, connectivity debugged
- SSH configured with key-based auth
- Apache installed, SELinux issue debugged and resolved
- firewalld locked down to required services only
- health-check.sh + cron scheduling
- backup.sh + tested restore
- 4 troubleshooting scenarios documented
- Full reboot persistence verified
- Documentation and screenshots organized
