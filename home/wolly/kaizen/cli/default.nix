{ pkgs, ... }:
{
  imports = [ ./zellij.nix ./sysfetch ];

  # NOTE: I should probably configure this
  programs.yazi.enable = true;

  home.packages = with pkgs; [
    fd        # simple and fast alternative to find
    eza       # Modern replacement for ls
    ydotool

    # Just fun stuff
    pipes-rs  # Animated pipes
    slides    # Terminal based presentation tool # TODO: Learn this
    lsix      # Shows thumbnails in terminal using sixel

    # Games
    toipe # A truty typing tester
    uchess
    vitetris
    _2048-in-terminal
  ];
}
