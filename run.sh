#!/bin/bash

# Machine setup runner script
# Usage: ./run.sh <machine_name> [playbook]
# Examples:
#   ./run.sh desktop           # Run full setup on desktop
#   ./run.sh laptop bootstrap  # Run bootstrap only on laptop
#   ./run.sh wsl site          # Run site playbook on WSL

set -e

MACHINE_NAME=${1:-}
PLAYBOOK=${2:-site}

if [ -z "$MACHINE_NAME" ]; then
    echo "Usage: $0 <machine_name> [playbook]"
    echo ""
    echo "Available machines:"
    ansible-inventory --list | jq -r '.local_machines.hosts | keys[]' 2>/dev/null || echo "  desktop, laptop, wsl, server"
    echo ""
    echo "Available playbooks:"
    echo "  bootstrap - Initial user setup (run as root)"
    echo "  site      - Full configuration (default)"
    echo "  user-setup - User-specific setup"
    exit 1
fi

echo "Running playbook '$PLAYBOOK' on machine '$MACHINE_NAME'..."
ansible-playbook -i inventory.yml playbooks/${PLAYBOOK}.yml --limit ${MACHINE_NAME} --ask-become-pass