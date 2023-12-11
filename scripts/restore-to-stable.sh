#!/usr/bin/bash

# Disk label directories
DISK_LABEL_DIR=/dev/disk/by-label
BOOT_DIR=$DISK_LABEL_DIR/boot
NIXOS_DIR=$DISK_LABEL_DIR/nixos

# Mount NixOs
mount $NIXOS_DIR /mnt && mount $BOOT_DIR /mnt/boot

# Clone Stable Repo
git clone https://github.com/kaizen-dw/Flakes ~/Flakes

# Regenerate Configuration
rm -rf /etc/nixos/configuration.nix && nixos-generate-config --root /mnt

# Install
nixos-install --flake ~/Flakes#laptop
