{ pkgs, ... }:
{
  systemPackages = with pkgs; [
    # Utilities
    unzip
    linux-wifi-hotspot
    nix-prefetch-github

    # Podman tools
    podman-tui
    podman-compose
  ];

  loginShellInit = /* bash */''

    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec Hyprland
    fi

  '';
}
