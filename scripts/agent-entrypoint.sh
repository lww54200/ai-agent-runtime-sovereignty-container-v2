#!/usr/bin/env bash
set -euo pipefail
/usr/local/bin/init-encrypted-volume.sh
/usr/local/bin/restrict-introspection.sh
case "${1:-status}" in
  status) echo "agent runtime ready: ${AGENT_ID:-unknown}" ;;
  shell) exec bash ;;
  *) exec "$@" ;;
esac
