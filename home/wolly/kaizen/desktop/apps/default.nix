{ inputs, pkgs, ... }:
let
  inherit (inputs) spicetify-nix;
in {
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
    # Gnome Apps
    nautilus            # File Manager
    # gnome-clocks
    # gnome-weather
    # gnome-calendar
    gnome-calculator

    # Social
    vesktop             # A custom Discord desktop app

    # Windows Stuff
    # wine-staging
    # bottles-unwrapped
    microsoft-edge-dev

    # Utilities
    obs-studio
    # easyeffects         # Equalizer
    pavucontrol         # Audio/Volume control
    wpa_supplicant_gui
   ];
}
