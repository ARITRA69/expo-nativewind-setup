#!/bin/bash

# Android SDK paths
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Check if an emulator is already running
if ! $ANDROID_HOME/platform-tools/adb devices | grep -q "emulator-"; then
  echo "No emulator running. Starting emulator..."

  # Get the first available AVD
  AVD_NAME=$($ANDROID_HOME/emulator/emulator -list-avds | head -n 1)

  if [ -z "$AVD_NAME" ]; then
    echo "Error: No Android Virtual Device (AVD) found."
    echo "Please create an AVD in Android Studio first."
    exit 1
  fi

  echo "Starting emulator: $AVD_NAME"
  # Start emulator in background
  $ANDROID_HOME/emulator/emulator -avd $AVD_NAME -no-snapshot-load > /dev/null 2>&1 &

  echo "Waiting for emulator to boot..."
  # Wait for emulator to be fully booted
  $ANDROID_HOME/platform-tools/adb wait-for-device

  # Wait for boot to complete
  while [ "$($ANDROID_HOME/platform-tools/adb shell getprop sys.boot_completed 2>/dev/null | tr -d '\r')" != "1" ]; do
    echo "Still booting..."
    sleep 2
  done

  echo "Emulator is ready!"
else
  echo "Emulator is already running."
fi

# Start Expo
expo start --android
