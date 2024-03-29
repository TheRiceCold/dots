#!/usr/bin/bash

# Disk label directories
# DISK_LABEL_DIR=/dev/disk/by-label
# NIXOS_DIR=$DISK_LABEL_DIR/nixos
# BOOT_DIR=$DISK_LABEL_DIR/boot

# Hardware directories
HARDWARE_CONFIG_FROM=/mnt/etc/nixos/hardware-configuration.nix
HARDWARE_CONFIG_TO=/home/ButterflyOS/nixos/hosts/kaizen/hardware-configuration.nix

# Mount NixOs
# mount $NIXOS_DIR /mnt

# Mount Boot
# mkdir -p /mnt/boot && mount $BOOT_DIR /mnt/boot

# Generate Basic Configuration
nixos-generate-config --root /mnt

# Copy your hardware configuration
cp $HARDWARE_CONFIG_FROM $HARDWARE_CONFIG_TO

# Install flake
cd flakes && nixos-install --flake .#kaizen

# Reboot
reboot
