Answers to Question 3b, part 3

---
## 1. Linting
- Linting ensures code style consistency and catches syntax or formatting issues early.
### Steps:
- Choose a linter for your language:
  - Python → flake8, pylint, black (formatter)
  - JavaScript/TypeScript → eslint, prettier
  - Go → golint, go vet
- Create a GitHub Actions job:
  - see answer3b_actionjob.yaml

## 2. Testing
- Automated tests ensure your code works as expected.
### Steps:
- Write unit tests using your testing framework:
  - Python → pytest, unittest
  - JavaScript → jest, mocha
  - Go → go test ./...
- Add a test job in your workflow:
  - see answer3b_testjob.yaml 
- Optionally, include coverage reports and fail on low coverage.

## 3. Deployment
- Deployment automatically pushes your code to the target environment (e.g., AWS, Azure, Docker, or GitHub Pages).
### Steps:
- Decide deployment target:
  - Container → Docker Hub, AWS ECR
  - Cloud → AWS Lambda, Azure Functions, Google Cloud Functions
  - Static site → GitHub Pages, Netlify
- Add a deploy job:
  - see answer3b_deployjob.yaml

---
### ✅ Best Practices
- Fail early: Lint first, then test.
- Use secrets for credentials.
- Use job dependencies (needs) to enforce order.
- Keep jobs modular (lint, test, deploy separate).
- Add notifications on failure (Slack, Teams, email).
