{ pkgs, ... }:
{ home.packages = with pkgs; [ pyprland ];

  xdg.configFile."hypr/pyprland.toml".text = let
    term = "${pkgs.foot}/bin/foot";
    file-manager-cli = "${pkgs.yazi}/bin/yazi";
    audio-control = "${pkgs.pavucontrol}/bin/pavucontrol";
  in ''
    [pyprland]
    plugins = [ "scratchpads", "magnify" ]

    [workspaces_follow_focus]
    max_workspaces = 9

    [scratchpads.volume]
    margin = 40
    size = "30% 50%"
    lazy = true
    animation = "fromRight"
    command = "${audio-control}"

    [scratchpads.network]
    animation = "fromBottom"
    command = "${term} nmtui"
    lazy = true
    size = "45% 60%"

    [scratchpads.explorer]
    animation = "fromTop"
    command = "${term} ${file-manager-cli}"
    lazy = true
    size = "50% 50%"
  '';
}
