FROM python:3.12



# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    # Build dependencies
    git \
    build-essential \
    # odbc    
    unixodbc \
    unixodbc-dev \
    freetds-dev \
    freetds-bin \
    tdsodbc \
    # utils
    curl \
    gnupg2 \
    apt-transport-https \
    cron \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install uv globally
RUN pip install --no-cache-dir uv


# Set default shell to bash for compatibility
SHELL ["/bin/bash", "-c"]

# Default command
CMD ["bash"]
