# Backup & Recovery

## backup.sh
Creates a timestamped tar.gz archive of /company under /backup.

## Tested restore (not just backup)
Created a test file in /company/Shared, ran a fresh backup, deleted
the file to simulate accidental data loss, then extracted the backup
archive back to / and confirmed the file returned with its original
content intact.

Note: this backup lives on the same VM/storage as the data it
protects. That's fine for a lab, but it is NOT real disaster
recovery — a real setup needs backups stored on separate physical
storage, ideally offsite.
