# 1. Use a stable base image
FROM ubuntu:22.04

# 2. Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# 3. Install sudo, build tools, and common utilities
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    git \
    wget \
    vim \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 4. Create a non-root user named 'devuser'
# This is safer than staying as root and lets you practice 'sudo'
RUN useradd -m -s /bin/bash devuser && \
    echo "devuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 5. Set the working directory
WORKDIR /home/devuser

# 6. Switch to the new user
USER devuser

# 7. Keep the container alive (so it doesn't exit immediately)
CMD ["tail", "-f", "/dev/null"]