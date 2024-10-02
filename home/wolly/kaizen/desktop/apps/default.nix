{ pkgs, ... }:
{
  imports = [ ./spicetify.nix ./graphic-editors ];

  programs = {
    foot = import ./foot pkgs;
    sioyek = import ./sioyek.nix;
    # ncmpcpp.enable = true; # I only listen on spotify or youtube
    mpv = {
      enable = true;
      config.gpu-context = "wayland";
      scripts = with pkgs.mpvScripts; [ mpris thumbnail ];
    };
  };

  home.packages = with pkgs; [
    neovide

    # Gnome Apps
    nautilus            # File Manager
    gnome-calculator

    # Social
    vesktop             # A custom Discord desktop app

    # Windows Stuff
    bottles-unwrapped
    wineWow64Packages.wayland
    # microsoft-edge-dev

    # Utilities
    obs-studio
    # easyeffects         # Equalizer
    pavucontrol         # Audio/Volume control
    wpa_supplicant_gui
  ];
}
