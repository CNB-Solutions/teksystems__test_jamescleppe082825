Answers to Question 1a and 2ab, part 2

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
