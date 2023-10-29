#! /usr/bin/bash

# Generate Basic NixOS configuration
nixos-generate-config --root /mnt

# Install git virtually
nix-shell -p git

# Clone Repository
cd && git clone https://github.com/kaizen-dw/Flakes

# Copy your hardware configuration
cp /mnt/etc/nixos/hardware-configuration.nix ~/Flakes/hosts/laptop/hardware-configuration.nix

# Install flake
cd Flakes && nixos-install --flake .#laptop
