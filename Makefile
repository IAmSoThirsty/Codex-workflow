.PHONY: help install install-dev clean test lint format docker-build docker-run venv

# Default target
.DEFAULT_GOAL := help

# Colors for output
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

help: ## Show this help message
	@echo "$(BLUE)Codex Workflow - Available Commands$(NC)"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "$(GREEN)%-20s$(NC) %s\n", $$1, $$2}'

venv: ## Create a virtual environment
	@echo "$(BLUE)Creating virtual environment...$(NC)"
	python3 -m venv .venv
	@echo "$(GREEN)Virtual environment created!$(NC)"
	@echo "$(YELLOW)Activate it with: source .venv/bin/activate$(NC)"

install: ## Install production dependencies
	@echo "$(BLUE)Installing production dependencies...$(NC)"
	pip install --upgrade pip
	pip install -r requirements.txt
	@echo "$(GREEN)Production dependencies installed!$(NC)"

install-dev: ## Install development dependencies
	@echo "$(BLUE)Installing development dependencies...$(NC)"
	pip install --upgrade pip
	pip install -r requirements-dev.txt
	pip install -e .
	@echo "$(GREEN)Development environment ready!$(NC)"

clean: ## Clean build artifacts and cache files
	@echo "$(BLUE)Cleaning up...$(NC)"
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type f -name "*.pyd" -delete
	find . -type d -name "*.egg-info" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".pytest_cache" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".mypy_cache" -exec rm -rf {} + 2>/dev/null || true
	rm -rf build/ dist/ htmlcov/ .coverage .tox/
	@echo "$(GREEN)Cleanup complete!$(NC)"

test: ## Run tests with coverage
	@echo "$(BLUE)Running tests...$(NC)"
	pytest tests/ -v --cov=src --cov-report=term-missing --cov-report=html
	@echo "$(GREEN)Tests complete! Coverage report in htmlcov/index.html$(NC)"

test-quick: ## Run tests without coverage
	@echo "$(BLUE)Running quick tests...$(NC)"
	pytest tests/ -v
	@echo "$(GREEN)Tests complete!$(NC)"

lint: ## Run linters (flake8, mypy)
	@echo "$(BLUE)Running linters...$(NC)"
	flake8 src/ tests/
	mypy src/
	@echo "$(GREEN)Linting complete!$(NC)"

format: ## Format code with black and isort
	@echo "$(BLUE)Formatting code...$(NC)"
	black src/ tests/
	isort src/ tests/
	@echo "$(GREEN)Code formatted!$(NC)"

format-check: ## Check code formatting without making changes
	@echo "$(BLUE)Checking code format...$(NC)"
	black --check src/ tests/
	isort --check src/ tests/
	@echo "$(GREEN)Format check complete!$(NC)"

security: ## Run security checks
	@echo "$(BLUE)Running security checks...$(NC)"
	pip-audit
	bandit -r src/
	@echo "$(GREEN)Security checks complete!$(NC)"

docker-build: ## Build Docker image
	@echo "$(BLUE)Building Docker image...$(NC)"
	docker build -t codex-workflow:latest .
	@echo "$(GREEN)Docker image built!$(NC)"

docker-run: ## Run Docker container
	@echo "$(BLUE)Running Docker container...$(NC)"
	docker-compose up codex-guardian

docker-dev: ## Run development Docker container
	@echo "$(BLUE)Starting development environment...$(NC)"
	docker-compose up codex-dev

docker-down: ## Stop Docker containers
	@echo "$(BLUE)Stopping containers...$(NC)"
	docker-compose down
	@echo "$(GREEN)Containers stopped!$(NC)"

run: ## Run the Codex Guardian locally
	@echo "$(BLUE)Running Codex Guardian...$(NC)"
	python -m codex.codex_deus_maximus

all: clean install-dev format lint test ## Clean, install, format, lint, and test

check: format-check lint test ## Run all checks without modifying files
