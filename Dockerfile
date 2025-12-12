FROM python:3.12



# Install system dependencies and Microsoft ODBC Drivers for SQL Server
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
    # Add Microsoft ODBC Driver 18 and 17 for SQL Server
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/ubuntu/24.04/prod.list -o /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql18 msodbcsql17 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install uv globally
RUN pip install --no-cache-dir uv


# Set default shell to bash for compatibility
SHELL ["/bin/bash", "-c"]

# Default command
CMD ["bash"]
