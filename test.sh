#!/usr/bin/env bash
set -euo pipefail
test -f Dockerfile
test -f docker-compose.yml
test -x scripts/init-encrypted-volume.sh
test -x scripts/restrict-introspection.sh
test -x scripts/agent-entrypoint.sh
bash scripts/init-encrypted-volume.sh | grep encrypted-volume-ready
bash scripts/restrict-introspection.sh | grep introspection-restricted
echo tests passed
