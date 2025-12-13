# 🛡️ Thirty's Monolith (Schematic Guardian)

**A "God-Tier" Repository Guardian that strictly enforces architecture, testing, and history standards.**

[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-v1.0.0-purple?logo=github)](https://github.com/marketplace/actions/thirtys-monolith)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## ⚡ What It Does
This is not just a linter. It is an **Enforcement Agent** that patrols your repository on every push.

| Component | Function |
| :--- | :--- |
| **Directory Police** | Enforces the strict `src/` and `.github/workflows/` folder structure. |
| **The Mirror Protocol** | Ensures every code file has a corresponding test file. |
| **History Guard** | Standardizes all commit messages to Conventional Commits. |
| **Code Sanitizer** | Auto-corrects indentation (4 spaces), trailing whitespace, and file endings. |

---

## 🚀 Installation (10 Seconds)

**Method 1: The Marketplace (Recommended)**
Add this step to any workflow file (e.g., `.github/workflows/main.yml`) to activate the guardian:

```yaml
steps:
  - uses: actions/checkout@v4
  - name: 🛡️ Run Codex Schematic Guardian
    uses: IAmSoThirsty/Codex-workflow@v1.0.0
