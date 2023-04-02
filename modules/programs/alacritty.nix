# Terminal Emualtor

{ pkgs, ... }:

{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        font = rec {
          normal.family = "JetBrainsMono Nerd Font";
          bold = { style = "Regular"; };
          size = 12;
        };
        offset = {
          y = 0;
          x = -1;
        };
      };
    };
  };
}
