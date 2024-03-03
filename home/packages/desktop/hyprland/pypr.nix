{ pkgs, ... }:
{
  home.packages = [ pkgs.pyprland ];
  xdg.configFile."hypr/pyprland.toml".text = let
    apps = import ./apps.nix { inherit pkgs; };
    mkPad = name: cmd: size: anim: ''
      [scratchpads.${name}]
      lazy = true
      command = "${cmd}"
      size = "${if size == "" then "50% 50%" else size}"
      animation = "from${if anim == "" then "Top" else anim}"
    '';
  in with apps; ''
    [pyprland]
    plugins = [ "scratchpads", "magnify" ]

    [workspaces_follow_focus]
    max_workspaces = 9

    # params: name, size, animation, command
    ${mkPad "term" term """"}
    ${mkPad "system" "${term} ${top}" """"}
    ${mkPad "network" "${term} nmtui" """"}
    ${mkPad "explorer" "${term} ${file-manager-cli}" """"}
  '';
}
