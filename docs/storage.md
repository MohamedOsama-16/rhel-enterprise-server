# Storage

## What I set up
- 15GB SCSI disk (/dev/sda) partitioned and dedicated to LVM
- PV → VG (company_vg) → LV (company_lv, 10GB initially)
- XFS filesystem, mounted at /company
- Persistent mount via UUID in /etc/fstab (verified with mount -a
  and a full reboot before trusting it)

## Storage expansion
Later extended company_lv from 10GB to 13GB live:
- lvextend -L +3G to grow the logical volume
- xfs_growfs to grow the filesystem itself (LV size and filesystem
  size are not the same thing — growing the LV alone does nothing
  until the filesystem is told to grow too)
- Verified with df -hT before and after, zero downtime

## Commands used
lsblk, fdisk, pvcreate, pvs, vgcreate, vgs, lvcreate, lvs, mkfs.xfs,
mount, blkid, df -hT, lvextend, xfs_growfs
