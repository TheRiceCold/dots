{ pkgs, ... }:
let
  apps = import ../apps.nix { inherit pkgs; };
  configFile = with apps; /* toml */ ''

    [pyprland]
    plugins = [ "scratchpads", "magnify" ]

    [workspaces_follow_focus]
    max_workspaces = 9

    [scratchpads.term]
    lazy = false
    size = "50% 50%"
    command = "${term}"
    animation = "fromTop"

    [scratchpads.system]
    lazy = true
    size = "50% 50%"
    animation = "fromTop"
    command = "${term} ${top}"

    [scratchpads.explorer]
    lazy = true
    size = "50% 50%"
    animation = "fromTop"
    command = "${term} ${file-manager-cli}"

  '';
in {
  home.packages = [ pkgs.pyprland ];
  xdg.configFile."hypr/pyprland.toml".text = configFile;
}
