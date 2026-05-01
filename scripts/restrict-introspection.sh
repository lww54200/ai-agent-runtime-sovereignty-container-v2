#!/usr/bin/env bash
set -euo pipefail
export HISTFILE=/dev/null
ulimit -c 0 || true
ulimit -n 256 || true
printf 'introspection-restricted: no-new-privileges, read-only rootfs, cap_drop=ALL, pids/mem limits configured by compose\n'
