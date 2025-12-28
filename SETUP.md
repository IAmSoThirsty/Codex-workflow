# 🚀 Setup Guide for Codex Workflow

This guide will walk you through setting up the complete development environment for Codex Workflow.

## 📋 Prerequisites

- Python 3.11 or higher
- Git
- Docker (optional, for containerized development)
- Make (optional, for convenience commands)

## 🔧 Quick Setup (5 minutes)

### Option 1: Local Development with Virtual Environment

```bash
# 1. Clone the repository
git clone https://github.com/IAmSoThirsty/Codex-workflow.git
cd Codex-workflow

# 2. Create a virtual environment
python3 -m venv .venv

# 3. Activate the virtual environment
# On Linux/macOS:
source .venv/bin/activate
# On Windows:
.venv\Scripts\activate

# 4. Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

# 5. Install the package in development mode
pip install -e .

# 6. Run the guardian
python -m codex.codex_deus_maximus
```

### Option 2: Using Make Commands (Recommended)

```bash
# 1. Clone the repository
git clone https://github.com/IAmSoThirsty/Codex-workflow.git
cd Codex-workflow

# 2. Create virtual environment
make venv

# 3. Activate virtual environment
source .venv/bin/activate

# 4. Install all development dependencies
make install-dev

# 5. Run tests to verify installation
make test

# 6. Run the guardian
make run
```

### Option 3: Using Docker

```bash
# 1. Clone the repository
git clone https://github.com/IAmSoThirsty/Codex-workflow.git
cd Codex-workflow

# 2. Build the Docker image
make docker-build
# OR
docker build -t codex-workflow:latest .

# 3. Run with Docker Compose
make docker-run
# OR
docker-compose up codex-guardian
```

## 📦 Dependencies Overview

### Core Dependencies (requirements.txt)
- **pytest**: Testing framework
- **pytest-cov**: Coverage reporting
- **pip-audit**: Security vulnerability scanning
- **python-dotenv**: Environment variable management
- **requests**: HTTP library
- **black**: Code formatting
- **flake8**: Code linting
- **isort**: Import sorting

### Development Dependencies (requirements-dev.txt)
All core dependencies plus:
- **pytest-mock**: Mocking for tests
- **pytest-timeout**: Test timeout handling
- **pytest-xdist**: Parallel test execution
- **pylint**: Advanced linting
- **mypy**: Type checking
- **bandit**: Security linting
- **ipython**: Enhanced Python shell
- **ipdb**: Debugger
- **pre-commit**: Git hooks

## 🧪 Testing

```bash
# Run all tests with coverage
make test

# Run tests without coverage (faster)
make test-quick

# Run specific test file
pytest tests/test_codex_deus_maximus.py -v

# Run tests in parallel
pytest tests/ -n auto
```

## 🎨 Code Quality

```bash
# Format code
make format

# Check formatting without changes
make format-check

# Run linters
make lint

# Run security checks
make security
```

## 🔍 Available Make Commands

Run `make help` to see all available commands:

```bash
make help
```

Key commands:
- `make venv` - Create virtual environment
- `make install` - Install production dependencies
- `make install-dev` - Install development dependencies
- `make test` - Run tests with coverage
- `make lint` - Run code linters
- `make format` - Format code
- `make clean` - Clean build artifacts
- `make docker-build` - Build Docker image
- `make docker-run` - Run in Docker
- `make run` - Run the guardian locally
- `make all` - Clean, install, format, lint, and test

## 🐳 Docker Development

### Build and Run
```bash
# Build the image
docker build -t codex-workflow:latest .

# Run the guardian
docker-compose up codex-guardian

# Development environment (with shell access)
docker-compose up codex-dev
```

### Docker Compose Services
- **codex-guardian**: Runs the main guardian application
- **codex-dev**: Interactive development environment

## 🌍 Environment Variables

Create a `.env` file from the example:

```bash
cp .env.example .env
```

Edit `.env` to customize your environment variables.

## 📁 Project Structure

```
Codex-workflow/
├── src/
│   └── codex/
│       ├── __init__.py
│       └── codex_deus_maximus.py
├── tests/
│   ├── __init__.py
│   └── test_codex_deus_maximus.py
├── .github/
│   └── workflows/
├── requirements.txt
├── requirements-dev.txt
├── setup.py
├── pyproject.toml
├── pytest.ini
├── Dockerfile
├── docker-compose.yml
├── Makefile
├── .gitignore
├── .dockerignore
├── .env.example
└── README.md
```

## 🔐 Security

The project includes multiple security layers:

1. **pip-audit**: Scans for known vulnerabilities in dependencies
2. **bandit**: Security linting for Python code
3. **Trivy**: Container vulnerability scanning (in CI/CD)
4. **CodeQL**: Deep security analysis (in CI/CD)

Run security checks:
```bash
make security
```

## 🐛 Troubleshooting

### Virtual Environment Issues
```bash
# Remove and recreate
rm -rf .venv
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements-dev.txt
```

### Permission Errors
```bash
# Fix permissions
chmod +x .venv/bin/activate
```

### Docker Issues
```bash
# Clean Docker cache
docker-compose down -v
docker system prune -a
make docker-build
```

### Import Errors
```bash
# Reinstall in editable mode
pip install -e .
```

## 📚 Additional Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Python Testing with pytest](https://docs.pytest.org/)
- [Docker Documentation](https://docs.docker.com/)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and linters: `make check`
5. Commit with conventional commits
6. Submit a pull request

## 📝 License

MIT License - see LICENSE file for details
