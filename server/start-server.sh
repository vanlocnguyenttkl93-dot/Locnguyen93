#!/bin/sh
# Start an OpenMU server with Docker (Linux/macOS), following the official docs.
set -e
cd "$(dirname "$0")"
command -v docker >/dev/null || { echo "Docker is required"; exit 1; }
command -v git >/dev/null || { echo "git is required"; exit 1; }
[ -f OpenMU/deploy/all-in-one/docker-compose.yml ] || git clone --depth 1 https://github.com/MUnique/OpenMU.git OpenMU
cd OpenMU/deploy/all-in-one
docker compose up -d --no-build
echo "Admin panel: http://localhost/ | connect ports 44405/44406 | client IP 127.127.127.127 (not 127.0.0.1)"
echo "Stop with: (cd $(pwd) && docker compose down)"
