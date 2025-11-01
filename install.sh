#!/bin/bash
set -e

VERSION="2.0.0"
APP_NAME="Cloq.app"
DMG_NAME="Cloq-${VERSION}-mac-arm64.dmg"
DMG_URL="https://github.com/CloqApp/cloq-release/releases/download/v${VERSION}/${DMG_NAME}"
APP_PATH="/Applications/${APP_NAME}"

echo "📦 Downloading Cloq v${VERSION}..."
curl -L -o "${DMG_NAME}" "${DMG_URL}"

echo "💿 Mounting DMG..."
MOUNT_POINT=$(hdiutil attach "${DMG_NAME}" -nobrowse | grep Volumes | awk '{print $3}')

echo "📂 Copying Cloq to Applications..."
cp -R "${MOUNT_POINT}/${APP_NAME}" /Applications/ || {
  echo "⚠️  Permission denied. Retrying with sudo..."
  sudo cp -R "${MOUNT_POINT}/${APP_NAME}" /Applications/
}

echo "💾 Unmounting DMG..."
hdiutil detach "${MOUNT_POINT}"

echo "🧹 Cleaning up..."
rm -f "${DMG_NAME}"

# echo "🔧 Removing macOS quarantine flag..."
if ! xattr -r -d com.apple.quarantine "${APP_PATH}" 2>/dev/null; then
#   echo "⚠️  Need sudo to remove quarantine flag."
  sudo xattr -r -d com.apple.quarantine "${APP_PATH}" 2>/dev/null || true
fi

echo "🚀 Launching Cloq..."
open "${APP_PATH}" || echo "✅ Installed successfully. You can open Cloq from Applications."

echo "🎉 Cloq v${VERSION} installed!"
