answers to question 2ab, part 1

---
1. Identification (Detecting an Attack)
Indicators of Compromise (IoCs)

Unusual traffic patterns (e.g., SQL injection payloads in query strings).

Unauthorized file uploads (.aspx, .php, web shells).

Sudden database spikes (new users with admin rights, schema changes).

Unexpected Windows Event Log entries (failed logins, privilege escalations).

Immediate Steps

Review SIEM/monitoring alerts.

Verify against threat intelligence feeds.

Correlate logs from IIS + Windows Security + MySQL.

---

2. Containment (Stop the Spread)
Short-term

Disable compromised accounts immediately (Windows + MySQL).

Block malicious IPs or ranges via firewall or IIS request filtering.

If attack persists, isolate the server from the network (but don’t power off).

Long-term

Redirect traffic through a WAF (Azure Front Door, Cloudflare, ModSecurity).

Enable IIS Request Filtering rules (block ;, --, xp_, UNION, etc.).

Force password resets for all privileged accounts.

---

3. Eradication (Remove the Threat)
System Review

Scan for web shells or modified .aspx/.dll files.

Compare web root files against a known clean baseline.

Run antivirus/EDR scan for persistence mechanisms.

Database Review

Check for unauthorized users, roles, triggers, or scheduled events.

Validate integrity of critical tables.

Patch & Harden

Apply latest Windows updates, .NET patches, and MySQL updates.

Remove unnecessary IIS modules and disable directory browsing.

Enable web.config hardening (custom errors, request validation, HTTPS only).

---

4. Recovery (Restore Operations)
Restore application files and databases from a verified clean backup if compromise is deep.

Test the application in a staging environment before re-exposing to production.

Re-enable network access gradually and monitor closely.

Perform post-recovery penetration testing or vulnerability scanning.

---

5. Lessons Learned (Post-Incident)
Document:

Timeline of attack detection, containment, and recovery.

Root cause (SQL injection? weak RDP creds? unpatched IIS?).

Gaps in monitoring or response.

Update:

Security policies, IR plan, and monitoring thresholds.

Developer guidance on secure coding (parameterized queries, input validation).

Train staff on updated procedures.

---

🔒 Special ASP.NET + IIS + MySQL Hardening Tips
ASP.NET

Use parameterized queries or ORMs (Entity Framework, Dapper).

Enforce strong web.config settings (<compilation debug="false">, <customErrors mode="On">).

IIS

Run app pools under unique, low-privilege identities.

Limit request size (maxAllowedContentLength, maxRequestLength).

Enable IIS Dynamic IP Restrictions.

MySQL

Bind MySQL to localhost if app and DB are on same host.

Use strong passwords, disable root remote login.

Enable SSL for DB connections.

