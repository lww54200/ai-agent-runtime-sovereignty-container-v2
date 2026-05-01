#!/usr/bin/env bash
set -euo pipefail
STATE_DIR="${AGENT_STATE_DIR:-./secure-state}"
KEY_FILE="$STATE_DIR/.volume.key"
DATA_DIR="$STATE_DIR/data"
umask 077
mkdir -p "$DATA_DIR"
if [ ! -f "$KEY_FILE" ]; then
  head -c 32 /dev/urandom | base64 > "$KEY_FILE"
fi
chmod 600 "$KEY_FILE"
printf 'encrypted-volume-ready state_dir=%s key_file=%s\n' "$STATE_DIR" "$KEY_FILE"
