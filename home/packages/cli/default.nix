{ pkgs, ... }:
{
  imports = [
    ./bat.nix
    ./zellij.nix
    ./kubernetes.nix
    ./neofetch
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
    figlet
    ydotool
    onefetch  # Git summary tool

    cava      # Audio Virtualizer
    pipes-rs  # Animated pipes

    # Games
    toipe             # A truty typing tester
    uchess
    vitetris
    _2048-in-terminal
  ];
}
