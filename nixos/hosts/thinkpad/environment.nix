{ pkgs, ... }:
{
  environment = {
    loginShellInit = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
    '';
    systemPackages = with pkgs;[
      # Utilities
      unzip
      linux-wifi-hotspot

      # Podman tools
      podman-tui
      podman-compose
    ];
  };

}
