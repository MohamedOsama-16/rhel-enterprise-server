# RHEL Enterprise Server Administration Project

## What this is
This is a hands-on RHEL 10 project I built to actually learn Linux System
Administration — not from tutorials, but by setting up, securing, and
running a server the way it'd be done in a real company environment.

## Environment
- Windows laptop → VMware Workstation → RHEL 10 VM
- 2 vCPU, 4GB RAM
- 25GB NVMe (OS disk) + 15GB SCSI (data disk, kept separate on purpose)
- A second Ubuntu VM acting as a client, so networking/SSH could be
  tested against a real second machine instead of just localhost

## What I actually did
- Set up LVM storage from scratch (PV → VG → LV → XFS → persistent mount)
- Created company departments (IT, Development, HR) with proper users,
  groups, permissions, SGID, and POSIX ACL
- Expanded storage live, with zero downtime
- Set up a second network (Host-only) and had to debug a real
  connectivity issue between the two VMs
- Configured SSH with both password and key-based authentication
- Installed Apache and hit a real SELinux/403 issue — had to trace it
  through permissions, SELinux context, and Apache config to find the
  actual root cause
- Locked down firewalld to only the services actually needed
- Wrote a bash health-check script and scheduled it with cron
- Wrote a backup script and actually tested restoring deleted data
- Documented 4 real troubleshooting scenarios I ran into
- Rebooted the server and verified everything survived on its own

## Structure
- `docs/` — what I did and why, per area
- `scripts/` — the automation scripts
- `screenshots/` — evidence for each major step

## What I took away from this
Most of what I learned wasn't the commands themselves — it was the habit
of checking before acting (like confirming the real disk name before
touching it), and debugging layer by layer instead of guessing. The
SELinux issue especially taught me that "permissions look fine" doesn't
mean the problem is solved.
