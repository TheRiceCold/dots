{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    package = pkgs.zellij;
    settings = {
      theme = "catppuccin-mocha";
      themes = {
        gruvbox-dark = {
          bg = [40 40 40];
          fg = [213 196 161];
          red = [204 36 29];
          green = [152 151 26];
          blue = [69 133 136];
          yellow = [215 153 33];
          magenta = [177 98 134];
          orange = [214 93 14];
          cyan = [104 157 106];
          black = [60 56 54];
          white = [251 241 199];
        };

        catppuccin-mocha = {
          bg = "#585b70";
          fg = "#cdd6f4";
          red = "#f38ba8";
          green = "#a6e3a1";
          blue = "#89b4fa";
          yellow = "#f9e2af";
          magenta = "#f5c2e7"; # Pink
          orange = "#fab387";  # Peach
          cyan = "#89dceb";    # Sky
          black = "#181825";   # Mantle
          white = "#cdd6f4";
        };
      };
      keybinds = {
        normal = { };
        locked = { };
        resize = { };
        pane = { };
      };
    };
  };
}
