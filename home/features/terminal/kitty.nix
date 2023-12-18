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
      tab_fade = 1;
      tab_bar_style = "fade";
      cursor_shape = "underline";
    };
  };
}
