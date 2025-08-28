Answers to Question 3a, part 1

---
## 1. Recommendations
- Access Controls
  - Enforce least privilege for Windows accounts, IIS app pools, and MySQL users.
  - Require MFA for admin access (RDP, MySQL, etc.).
- Logging & Monitoring
  - Enable IIS logging (full request details, including user agent, referrer, query string).
  - Enable Windows Event Forwarding or send logs to a SIEM.
  - Enable MySQL general log and slow query log (rotated frequently).
- Backups
  - Maintain daily encrypted backups of database and site files.
  - Test restore procedures regularly.
- Patching
  - Keep Windows, IIS, .NET runtime, and MySQL up to date.
  - Remove unused IIS modules.

---
