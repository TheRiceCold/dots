# DOCS: https://github.com/hyprland-community/pyprland/wiki
{ pkgs, ... }:
let
  apps = import ../../apps/get-apps.nix pkgs;
  configFile = with apps; /*toml*/ ''
    [pyprland]
    plugins = [ "scratchpads", "magnify", "layout_center" ]

    [scratchpads.term]
    lazy = false
    size = "38% 40%" # width height
    command = "${term}"
    animation = "fromBottom"
  '';
in {
  home.packages = [ pkgs.pyprland ];
  xdg.configFile."hypr/pyprland.toml".text = configFile;
}
