# TODO: Move to a kaizen-widgets repo
{ inputs, pkgs, ... }:
let
  inherit (inputs) ags matugen;
in {
  imports = [
    ags.homeManagerModules.default
    # inputs.astal.homeManagerModules.default
  ];

  services.playerctld.enable = true;

  home.packages = with pkgs; [
    bun
    dart-sass
    libnotify
    playerctl
    brightnessctl

    swww            # Animated wallpaper Daemon
    hyprpicker      # Color Picker
    wl-clipboard    # Clipboard Utility
    swayimg         # Image Viewer
    swappy          # Snapshot Editing Tool
    gromit-mpx      # Desktop Annotation Tool
    slurp           # Region Selector
    grim            # Grab Images
    wl-screenrec    # Screen Recorder

    matugen.packages.${pkgs.system}.default
  ];

  programs = {
    cava.enable = true;
    # astal = {
    #   enable = true;
    #   extraPackages = with pkgs; [
    #     libadwaita
    #   ];
    # };
    ags = {
      enable = true;
      # configDir = conf.config;
      extraPackages = with pkgs; [ gtksourceview3 ];
    };
  };
}
