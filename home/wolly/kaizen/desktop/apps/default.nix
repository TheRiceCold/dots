{ inputs, pkgs, ... }:
let
  inherit (inputs) spicetify-nix;
in {
  imports = [ spicetify-nix.homeManagerModule ];

  programs = {
    foot = import ./foot pkgs;
    sioyek = import ./sioyek.nix;
    spicetify = import ./spicetify.nix pkgs spicetify-nix;
    # ncmpcpp.enable = true; # I only listen to spotify or youtube
    mpv = {
      enable = true;
      config.gpu-context = "wayland";
      scripts = with pkgs.mpvScripts; [ mpris thumbnail ];
    };
  };

  home.packages = with pkgs; with gnome; [
    # Ags
    ydotool

    # Social
    vesktop     # A custom Discord desktop app

    # Gnome Apps
    nautilus

    # Graphic Editors
    blender         # 3d graphics
    inkscape        # Vector graphics.
    libresprite     # Pixel art tool.
    krita           # Raster graphics, mostly used this for digital art/drawing

    # Windows Stuff
    wine-staging
    bottles-unwrapped

    easyeffects     # Equalizer
    pavucontrol     # Audio/Volume control

    # Development
    neovide         # Cool neovim GUI client
    godot_4         # Open source game engine
    # warp-terminal
    # postman         # API Development Environment
   ];
}
