{ inputs, pkgs, ... }:
let
  inherit (inputs) spicetify-nix;
in {
  imports = [ spicetify-nix.homeManagerModule ];

  programs = {
    foot = import ./foot pkgs;
    sioyek = import ./sioyek.nix;
    spicetify = import ./spicetify.nix pkgs spicetify-nix;
    # ncmpcpp.enable = true; # I only listen on spotify or youtube
    mpv = {
      enable = true;
      config.gpu-context = "wayland";
      scripts = with pkgs.mpvScripts; [ mpris thumbnail ];
    };
  };

  home.packages = with pkgs; with gnome; [
    # Gnome Apps
    nautilus            # File Manager
    # gnome-clocks
    # gnome-weather
    # gnome-calendar
    gnome-calculator

    # Social
    vesktop             # A custom Discord desktop app

    # Graphic Editors
    libresprite         # Pixel Art
    blender             # 3d Graphics
    inkscape            # Vector Graphics
    krita               # Raster Graphics
    gimp                # Image Maniputation

    # Utilities
    obs-studio
    easyeffects         # Equalizer
    pavucontrol         # Audio/Volume control
    wpa_supplicant_gui

    # Windows Stuff
    # wine-staging
    # bottles-unwrapped
    # microsoft-edge-dev

    # Development
    # zed-editor        # Not yet stable
    neovide             # Cool neovim GUI client
    godot_4             # Open source game engine
   ];
}
