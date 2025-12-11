FROM ubuntu:24.04


# Install system dependencies and Python
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
    python3 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install uv globally
RUN pip3 install --no-cache-dir uv


# Set default shell to bash for compatibility
SHELL ["/bin/bash", "-c"]

# Default command
CMD ["bash"]
