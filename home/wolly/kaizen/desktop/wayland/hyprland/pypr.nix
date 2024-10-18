# DOCS: https://github.com/hyprland-community/pyprland/wiki
{ pkgs, ... }: {
  home.packages = [pkgs.pyprland];
  xdg.configFile."hypr/pyprland.toml".text = /*toml*/''
    [pyprland]
    plugins = ["scratchpads", "magnify", "layout_center"]

    [scratchpads.term]
    lazy = false
    size = "38% 40%"         # width height
    animation = "fromBottom"
    command = "${pkgs.foot}/bin/foot"
  '';
}
