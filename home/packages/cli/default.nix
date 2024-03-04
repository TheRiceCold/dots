{ pkgs, ... }:
{
  imports = [
    ./bat.nix
    ./zellij.nix
    ./kubernetes.nix

    ./sysfetch
  ];

  programs = {
    btop = {
      enable = true;
      settings = {
        vim_keys = true;
        rounded_corners = true;
        theme_background = false;
        color_theme = "tokyo-storm";
      };
    };

    lazygit.enable = true;
    yazi.enable = true;
  };

  home.packages = with pkgs; [
    fd        # simple and fast alternative to find
    eza       # Modern replacement for ls
    ydotool

    cava      # Audio Virtualizer
    pipes-rs  # Animated pipes

    lsix      # Shows thumbnails in terminal using sixel
    slides    # Terminal based presentation tool

    # Games
    toipe             # A truty typing tester
    uchess
    vitetris
    _2048-in-terminal
  ];
}
