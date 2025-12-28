# Use Python 3.11 slim image for smaller size
FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy the rest of the application
COPY . .

# Install the package in editable mode
RUN pip install -e .

# Create a non-root user
RUN useradd -m -u 1000 codex && \
    chown -R codex:codex /app

USER codex

# Default command
CMD ["python", "-m", "codex.codex_deus_maximus"]
