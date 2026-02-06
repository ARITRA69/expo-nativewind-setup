#!/bin/bash

# Android SDK paths
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

echo "Setting up ADB for Docker..."

# Kill existing ADB server
echo "Stopping existing ADB server..."
$ANDROID_HOME/platform-tools/adb kill-server 2>/dev/null || true

# Start ADB server with network binding (allows Docker to connect)
echo "Starting ADB server with network binding..."
$ANDROID_HOME/platform-tools/adb -a -P 5037 nodaemon server-start > /dev/null 2>&1 &

# Wait a moment for server to start
sleep 2

# Check ADB devices
echo "Connected devices:"
$ANDROID_HOME/platform-tools/adb devices

echo ""
echo "✓ ADB is now accessible to Docker containers"
echo "You can now run: bun run docker:dev"
