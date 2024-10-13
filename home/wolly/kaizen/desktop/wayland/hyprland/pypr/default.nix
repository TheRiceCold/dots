# DOCS: https://github.com/hyprland-community/pyprland/wiki
{ pkgs, ... }:
{
  home.packages = [ pkgs.pyprland ];
  xdg.configFile."hypr/pyprland.toml".source = ./config.toml;
}
