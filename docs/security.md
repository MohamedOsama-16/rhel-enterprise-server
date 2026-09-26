# Security

## SSH
Configured SSH with password auth first, then generated an ed25519
key pair on the Ubuntu client and copied the public key to RHEL with
ssh-copy-id. Verified key-based login works with zero password
prompt. Root password login over SSH was left as-is for this lab
(not disabled) — in a real production environment this should be
turned off, and access should rely on keys only.

## Permissions, SGID, ACL
- Company directories (/company/IT, Development, HR) are owned by
  their matching group, with 770 permissions (group has full access,
  others have none) — tested by trying to access HR as a Development
  user (denied) and as an HR user (allowed)
- SGID set on all three directories so new files inherit the
  directory's group automatically
- POSIX ACL used on /company/HR to give the IT group read-only
  access without touching the base HR/Development permissions —
  tested with itadmin (read access via ACL) and developer1
  (still denied)

## firewalld
Only ssh, http, and the default RHEL services (cockpit,
dhcpv6-client) are allowed. Nothing opened beyond what the project
actually needed.

## SELinux — a real troubleshooting case
After pointing Apache's DocumentRoot to /company/Shared/webportal,
requests returned 403 Forbidden even though file permissions looked
correct (644, readable by all). Investigation:
1. Checked ls -lZ — SELinux context was "unlabeled_t", not the
   expected httpd_sys_content_t
2. Fixed it with semanage fcontext + restorecon — still 403
3. Ruled out SELinux entirely with a temporary setenforce 0 test
   (still failed) — reverted to enforcing immediately after
4. Found the actual cause: Apache 2.4 requires an explicit
   <Directory> block with "Require all granted" for any path outside
   the default /var/www — added one for the new path, and it worked

This was a good reminder that SELinux, file permissions, and
application config are three separate layers that can each block
access independently — "permissions look fine" doesn't rule out
the other two.
