FROM oven/bun:1-debian

# Install dependencies for Expo and Android tools
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    unzip \
    openjdk-17-jdk \
    && rm -rf /var/lib/apt/lists/*

# Install Android SDK Platform Tools (for ADB)
RUN mkdir -p /opt/android-sdk && \
    cd /opt/android-sdk && \
    wget -q https://dl.google.com/android/repository/platform-tools-latest-linux.zip && \
    unzip platform-tools-latest-linux.zip && \
    rm platform-tools-latest-linux.zip

# Add Android tools to PATH
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/platform-tools

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json bun.lock* ./

# Install dependencies
RUN bun install

# Copy project files
COPY . .

# Expose Expo ports
# 8081: Metro bundler
# 19000: Expo DevTools
# 19001: Expo DevTools (iOS)
# 19002: Expo DevTools (Android)
EXPOSE 8081 19000 19001 19002

# Start Expo
CMD ["bun", "run", "start"]
