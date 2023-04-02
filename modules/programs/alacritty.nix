{ pkgs, ... }:

{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        font = rec {                          # Font - Laptop has size manually changed at home.nix
          normal.family = "JetBrainsMono Nerd Font";
          bold = { style = "Regular"; };
          size = 12;
        };
        offset = {                            # Positioning
          x = -1;
          y = 0;
        };
      };
    };
  };
}
