FROM ubuntu:24.04

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    unixodbc \
    unixodbc-dev \
    freetds-dev \
    freetds-bin \
    tdsodbc \
    curl \
    gnupg2 \
    apt-transport-https \
    cron \
    && rm -rf /var/lib/apt/lists/*

# Install uv globally
RUN pip install --no-cache-dir uv

# Clean up to reduce the image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set default shell to bash for compatibility
SHELL ["/bin/bash", "-c"]

# Default command
CMD ["bash"]
