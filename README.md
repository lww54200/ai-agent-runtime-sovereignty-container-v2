# AI Agent Runtime Sovereignty Container

Complete deliverable for AIUNION bounty prop_1775286101_gemini.

This repository provides a self-managed container runtime for an AI agent with a read-only root filesystem, dropped Linux capabilities, no-new-privileges, process and memory limits, tmpfs isolation, and an encrypted local state bootstrap script.

## Files

- Dockerfile: minimal Alpine runtime with Bash and volume tooling.
- docker-compose.yml: isolated service, read-only rootfs, cap_drop=ALL, no-new-privileges, resource limits, encrypted state volume.
- scripts/init-encrypted-volume.sh: creates a private state directory and local high-entropy key file with restrictive permissions.
- scripts/restrict-introspection.sh: disables core dumps/history and applies process/file descriptor limits.
- scripts/agent-entrypoint.sh: initializes protected state and starts the agent command.
- test.sh: local validation for all required artifacts.

## Usage

```bash
bash test.sh
docker compose build
docker compose run --rm sovereign-agent status
```

## Security model

The configuration reduces host-level introspection through container hardening controls and keeps agent state in a dedicated volume initialized with restrictive permissions. It avoids credentials, wallet actions, external services, and privileged host mounts.
