Answers to Question 1a and 2a, part 2

---
It would be nice to actually memerize this but why when we have the web.  We all can easy google/chatgpt these answers.  Here are PASTED results

---
### 1a
## 1. Use Minimal and Trusted Base Images
- What it means: Start your Dockerfiles with small, trusted base images (like alpine or distroless) instead of full OS images (like ubuntu or centos).
- Why: Smaller images reduce the attack surface, minimize vulnerabilities, and make it easier to patch and scan. Always verify images from trusted sources (Docker Hub official images or internal registries).
## 2. Run Containers as Non-Root Users
- What it means: Configure containers to run applications as a non-root user rather than the default root inside the container.
- Why: If an attacker breaks out of the container, having root inside the container increases the risk of compromising the host. Adding USER in the Dockerfile or using Kubernetes Pod Security Policies mitigates this.
## 3. Regularly Scan Images for Vulnerabilities
- What it means: Use tools like Trivy, Clair, or Docker Scan to check for CVEs (Common Vulnerabilities and Exposures) in your images.
- Why: Dependencies and OS packages in images may contain known vulnerabilities. Regular scans help detect and remediate issues before deployment.
## 4. Limit Container Capabilities and Resources
- What it means: Drop unnecessary Linux capabilities and set resource limits (cpu, memory) for containers. Use flags like --cap-drop and --cap-add.
- Why: By default, containers have more privileges than most apps need. Dropping capabilities and applying limits prevents privilege escalation, denial-of-service, or accidental resource exhaustion.
## 5. Keep Secrets Out of Images
- What it means: Never bake passwords, API keys, or certificates directly into Docker images or environment variables. Instead, use secret management systems (Docker secrets, Vault, Kubernetes secrets).
- Why: Secrets hardcoded in images are hard to rotate and can easily leak if the image is shared or pushed to a registry.
---
##⚡ Bonus best practices if you want more:
- Use signed images (Docker Content Trust)
- Enable logging and monitoring for containers
- Keep Docker and the host OS patched

---
### 2a
## 1. Role-Based Access Control (RBAC)
- RBAC allows you to define who (user, group, or service account) can perform what actions (verbs like get, list, create, delete) on which resources (pods, services, secrets, etc.).
- This helps enforce the principle of least privilege, ensuring workloads and users only get the access they actually need.
## 2. Network Policies
- By default, pods in a Kubernetes cluster can communicate freely with each other.
- Network Policies let you control which pods/services can talk to each other and what external traffic is allowed in or out.
- This limits the blast radius if a pod is compromised and helps enforce zero-trust networking.
## 3. Secrets Management
- Kubernetes provides a built-in resource called Secrets to store sensitive data such as passwords, API keys, or certificates.
- Secrets are base64-encoded (not encrypted by default, but can be encrypted at rest using KMS providers).
- Access to secrets is controlled through RBAC, and they can be injected into pods as environment variables or mounted as files, reducing exposure.
---
