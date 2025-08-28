Answers to Question 3ab, part 1

---
## 1. System Recommendations
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
## 2. Network Recommendations
- Subnetting
  - Put web app/server(s) and MySQL/server(s) on different subnets
  - Only allow needed ports and ip address/ranges to talk between those subnets
- Create application gateway (Azure) in front of web app\server(s)
  - If possible, only allow needed users access to ip address/ranges
  - Create WAF policy to limit attack vertors
- use only SSL and TLS 2.0
  - for all communication between user-2-web and web-2-mysql
