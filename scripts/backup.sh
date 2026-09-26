#!/bin/bash
mkdir -p /backup
DATE=$(date +%Y%m%d-%H%M%S)
tar -czf /backup/company-backup-$DATE.tar.gz /company
echo "Backup created: /backup/company-backup-$DATE.tar.gz"
