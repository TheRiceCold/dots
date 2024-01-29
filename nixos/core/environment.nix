{ pkgs, ... }:
{ 
  environment = {
    systemPackages = with pkgs; [
      git
      fzf
      btop
      lsof
      unzip
      wget
      gcc
      bat
      clang
      gnumake
      killall
      ripgrep

      # Podman tools
      podman-tui
      podman-compose

      linux-wifi-hotspot
    ];

    loginShellInit = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
    '';
  };
}
