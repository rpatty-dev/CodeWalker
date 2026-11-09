#!/usr/bin/env bash
set -e

# ==============================================================================
# CodeWalker for macOS - Lightweight Launcher
# Powered by Whisky (Wine + Apple Game Porting Toolkit / DXVK)
# ==============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

WHISKY_APP="/Applications/Whisky.app"
WHISKY_CMD="$WHISKY_APP/Contents/Resources/WhiskyCmd"
USER_WHISKY_BIN="$HOME/.local/bin/whisky"
BOTTLE_NAME="CodeWalker"

echo "=== CodeWalker Mac Launcher ==="

# 1. Verify Whisky installation
if [ ! -d "$WHISKY_APP" ]; then
    echo "[!] Whisky.app not found in /Applications."
    echo "[*] Downloading Whisky (lightweight Wine wrapper for Apple Silicon)..."
    TMP_ZIP="/tmp/Whisky.zip"
    curl -sL -o "$TMP_ZIP" "https://github.com/Whisky-App/Whisky/releases/download/v2.3.5/Whisky.zip"
    unzip -q -o "$TMP_ZIP" -d /Applications/
    rm -f "$TMP_ZIP"
    xattr -cr "$WHISKY_APP" 2>/dev/null || true
    echo "[✓] Whisky.app installed to /Applications."
fi

# Ensure whisky CLI is available
if [ -f "$WHISKY_CMD" ]; then
    mkdir -p "$HOME/.local/bin"
    ln -sf "$WHISKY_CMD" "$USER_WHISKY_BIN"
    WHISKY_EXEC="$WHISKY_CMD"
else
    echo "[!] WhiskyCmd binary not found inside Whisky.app"
    exit 1
fi

# 2. Check / Create Bottle
if ! "$WHISKY_EXEC" list | grep -q "$BOTTLE_NAME"; then
    echo "[*] Creating new lightweight bottle '$BOTTLE_NAME'..."
    "$WHISKY_EXEC" create "$BOTTLE_NAME"
    echo "[✓] Bottle '$BOTTLE_NAME' created."
fi

# 3. Locate CodeWalker.exe
CW_EXE=""
CANDIDATE_PATHS=(
    "$REPO_ROOT/bin/Release/net48/CodeWalker.exe"
    "$REPO_ROOT/CodeWalker/bin/Release/net48/CodeWalker.exe"
    "$REPO_ROOT/CodeWalker.exe"
    "$HOME/Downloads/CodeWalker/CodeWalker.exe"
    "$HOME/Downloads/CodeWalker.exe"
)

for p in "${CANDIDATE_PATHS[@]}"; do
    if [ -f "$p" ]; then
        CW_EXE="$p"
        break
    fi
done

if [ -z "$CW_EXE" ]; then
    echo ""
    echo "[!] CodeWalker.exe not found in standard paths."
    echo "[*] You can download the latest pre-compiled build from:"
    echo "    https://github.com/rpatty-dev/CodeWalker/releases"
    echo "    or GTA5-Mods: https://www.gta5-mods.com/tools/codewalker-gtav-interactive-3d-map"
    echo ""
    read -r -p "Enter the full path to CodeWalker.exe (or press Enter to open Whisky GUI): " USER_INPUT_PATH
    if [ -n "$USER_INPUT_PATH" ] && [ -f "$USER_INPUT_PATH" ]; then
        CW_EXE="$USER_INPUT_PATH"
    else
        echo "[*] Opening Whisky. You can select the '$BOTTLE_NAME' bottle and run CodeWalker from the UI."
        open -a "$WHISKY_APP"
        exit 0
    fi
fi

echo "[*] Launching CodeWalker from: $CW_EXE"
"$WHISKY_EXEC" run "$BOTTLE_NAME" "$CW_EXE" "$@"
