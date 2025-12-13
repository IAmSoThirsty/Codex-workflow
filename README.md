# Codex-workflow
This bot is configured for **24/7 Aggressive Patrol**. It lives in your repository and automatically cleans, fixes, and secures every single line of code you push—to any branch, at any time.
# 🛡️ Universal Security & Fixer Bot (Aggressive Edition)

![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)
![Security Status](https://img.shields.io/badge/Security-Hardened-green?style=for-the-badge)
![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green.svg?style=for-the-badge)

**The "Set It and Forget It" Automation for GitHub.**

This bot is configured for **24/7 Aggressive Patrol**. It lives in your repository and automatically cleans, fixes, and secures every single line of code you push—to any branch, at any time.

---

## ⚡ What It Does (The "4-Bot" System)

| Bot Name | Role | What It Does |
| :--- | :--- | :--- |
| **1. The Fixer** | *Auto-Correction* | Instantly rewrites messy code (Python, JS, Java, C++, Go, etc.) to match perfect industry standards. |
| **2. Grammar Police** | *Linting* | Checks for style consistency (Super-Linter) on files the Fixer can't handle automatically. |
| **3. Security Guard** | *Vulnerability Scan* | Scans dependencies and files for known CVEs and security flaws (Trivy). |
| **4. Bug Hunter** | *Deep Analysis* | Uses GitHub CodeQL to find complex logic bugs and security risks in 8+ languages. |

---

## 🚀 Installation (1 Minute)

### Step 1: Add the Script
1.  Create a file in your repository at: `.github/workflows/universal-bot.yml`
2.  Paste the **Master Script** code into it.
3.  Commit the file.

### Step 2: Grant Permissions (Critical!)
*For "The Fixer" to automatically rewrite your code, it needs permission to edit files.*

1.  Go to your repository **Settings**.
2.  Click **Actions** > **General** (left sidebar).
3.  Scroll down to **Workflow permissions**.
4.  Select **Read and write permissions**.
5.  Click **Save**.

---

## ⏰ When Does It Run? (Triggers)

This bot is configured to be **Aggressive**. You do not need to manually run it.

* **Any Push (Private or Public):** Runs immediately when you push code to `main`, `dev`, `feature-123`, or *any* other branch.
* **Pull Requests:** Runs whenever a PR is opened to block bad code from merging.
* **Nightly Patrol:** Runs automatically every night at **2 AM UTC** to catch new zero-day vulnerabilities in old code.

---

## 🛠️ Supported Languages for Auto-Fixing
The bot automatically detects and fixes:
* **Python** (Black)
* **JavaScript / TypeScript** (Prettier)
* **Java** (Google Java Format)
* **C / C++** (Clang-Format)
* **Go** (gofmt)
* **C#** (dotnet format)
* **Ruby** (Rubocop)

---

## 📄 License
MIT License
