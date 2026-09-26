# Architecture

Windows laptop
  → VMware Workstation
    → RHEL 10 Server (25GB NVMe OS disk + 15GB SCSI data disk)
    → Ubuntu Client (separate VM, used to test SSH/networking for real)

Both VMs have two network adapters:
- NAT — internet access, independent for each VM
- Host-only — private network between RHEL and Ubuntu only

RHEL server layout:
/company
├── IT           (group: IT, 770 + ACL read for none extra)
├── Development   (group: Development, 770)
├── HR            (group: HR, 770 + ACL read-only for IT)
└── Shared        (includes the Apache DocumentRoot)

Storage: /company is a separate XFS filesystem on top of LVM
(PV → VG → LV), independent from the OS disk, so it can be backed
up, resized, or recovered without touching the OS itself.
