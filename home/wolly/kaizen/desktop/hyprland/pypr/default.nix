# DOCS: https://github.com/hyprland-community/pyprland/wiki
{ inputs, pkgs, ... }:
let
  apps = import ../apps.nix { inherit pkgs; };
  configFile = with apps; /* toml */ ''

    [pyprland]
    plugins = [ "scratchpads", "magnify" ]

    [scratchpads.term]
    lazy = false
    size = "40% 40%" # width height
    animation = "fromTop"
    command = "${term}"

  '';
in {
  xdg.configFile."hypr/pyprland.toml".text = configFile;
  home.packages = [ inputs.pyprland.packages.${pkgs.system}.default ];

  programs.bash.initExtra = /* bash */ ''

    # Runs only on first instance (scratchpad terminal)
    LIVE_COUNTER=$(ps a | awk '{print $2}' | grep -vi "tty*" | uniq | wc -l);
    if [ $LIVE_COUNTER -eq 1 ]; then
      fastfetch
    fi

  '';
}
