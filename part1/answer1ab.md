Answers to Question 1a and 1b, part 1

---

## 🔹 1. Application Layer (ASP.NET)

* **SQL Injection** – If queries are built with string concatenation instead of parameterized queries, attackers can exfiltrate or modify MySQL data.
* **Cross-Site Scripting (XSS)** – Unsanitized user input rendered in pages allows injection of malicious JavaScript.
* **Cross-Site Request Forgery (CSRF)** – Lack of anti-forgery tokens allows attackers to perform actions on behalf of authenticated users.
* **Authentication & Session Hijacking**

  * Weak password policies or lack of MFA.
  * Session IDs stored in predictable cookies or over unencrypted HTTP.
* **Insecure File Uploads** – Uploading malicious files (e.g., `.aspx` shells or executables) if validation is weak.
* **Deserialization Attacks** – ASP.NET apps that deserialize untrusted input are at risk of remote code execution (RCE).
* **Configuration Disclosure** – Web.config leaks (via misconfigured IIS) may expose connection strings and secrets.

---

## 🔹 2. Web Server Layer (IIS on Windows Server 2022)

* **Default/Weak IIS Configuration** – Directory browsing, verbose error messages, trace.axd exposed.
* **Misconfigured Request Filtering** – Allows dangerous verbs (PUT, DELETE, TRACE).
* **IIS Module Exploits** – Vulnerable or outdated IIS modules/extensions could be abused.
* **Weak TLS/SSL** – Using outdated protocols (e.g., TLS 1.0/1.1), weak ciphers, or self-signed certificates.

---

## 🔹 3. Database Layer (MySQL on Windows)

* **Weak MySQL Authentication** – Default accounts, weak passwords, or no SSL between app and DB.
* **Privilege Escalation** – Application accounts with `root`-level access instead of least privilege.
* **SQL Injection Amplification** – Poor logging/monitoring may let attackers pivot inside DB.
* **MySQL Service Exposure** – If MySQL is listening on external interfaces, it’s vulnerable to brute force or exploit attempts.

---

## 🔹 4. Operating System (Windows Server 2022)

* **Unpatched Vulnerabilities** – Attackers exploiting Windows kernel, RDP, or IIS-related CVEs.
* **Privilege Escalation** – Misconfigured service permissions or weak local admin accounts.
* **Credential Dumping** – Using tools like Mimikatz to steal stored credentials.
* **Unnecessary Services** – Enabled SMB, RDP, or FTP services that widen the attack surface.

---

## 🔹 5. Network & Perimeter

* **RDP Brute Force / Exposed Management Interfaces** – If RDP or WinRM is publicly accessible.
* **DDoS Attacks** – Flooding IIS or exhausting resources.
* **Weak Firewall Rules** – Allowing traffic from anywhere to MySQL or IIS.
* **Man-in-the-Middle Attacks** – If TLS isn’t enforced end-to-end.

---
