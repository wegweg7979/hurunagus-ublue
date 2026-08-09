#!/bin/bash
set -euo pipefail

MARKER="/var/lib/.user-groups-initialized"
[[ -f "$MARKER" ]] && exit 0

for user in $(awk -F: '$3>=1000 && $3<65534 {print $1}' /etc/passwd); do
    usermod -aG audio,video,kvm,render,input "$user"
done

touch "$MARKER"
