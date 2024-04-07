{ inputs, pkgs, ... }:
let
  inherit (inputs) ags matugen;
in {
  imports = [ ags.homeManagerModules.default ];

  services.playerctld.enable = true;

  home.packages = with pkgs; [
    bun
    dart-sass
    libnotify
    playerctl
    brightnessctl

    ydotool
    swww            # Animated wallpaper Daemon
    hyprpicker      # Color Picker
    wl-clipboard    # Clipboard Utility
    swayimg         # Image Viewer
    wl-screenrec    # Screen Recorder

    matugen.packages.${pkgs.system}.default
  ];

  programs = {
    cava.enable = true;
    ags = {
      enable = true;
      extraPackages = with pkgs; [ gtksourceview3 ];
      # INFO: I prefer the config to be in separate repo, https://github.com/TheRiceCold/kaizen-widgets
      # configDir = conf.config;
    };
  };
}
