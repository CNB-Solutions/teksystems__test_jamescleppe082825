Answers to Question 1c, part 1

## 🔹 Common Misconfigurations

* Running the ASP.NET app with **high-privileged service accounts**.
* Storing **secrets in web.config or plaintext files**.
* Logging sensitive data (e.g., passwords, tokens) in IIS/Windows logs.
* No **Web Application Firewall (WAF)** in front of IIS.
* Lack of monitoring/auditing for anomalies in Windows Event Logs, IIS logs, and MySQL logs.

---

✅ **Mitigations to consider**:

* Apply **principle of least privilege** (App pool identity, MySQL user permissions).
* Use **parameterized queries / ORM** to prevent SQL injection.
* Enforce **HTTPS/TLS 1.2+** and secure cookies.
* Regularly patch **Windows Server, IIS, .NET runtime, and MySQL**.
* Implement **WAF rules** (e.g., ModSecurity, Azure Front Door, Cloudflare WAF).
* Enable **App Insights / logging / intrusion detection**.

---
