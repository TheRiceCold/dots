{ pkgs, ... }:
{
  home.packages = [ pkgs.kitty ];
  programs.kitty = {
    enable = true;
    font = {
      size = 12;
      name = "JetBrainsMono Nerd Font";
    };
    settings = {
      cursor_shape = "underline";
      tab_bar_style = "fade";
      tab_fade = 1;
    };
  };
}
