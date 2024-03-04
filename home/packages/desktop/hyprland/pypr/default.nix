# INFO: https://github.com/hyprland-community/pyprland/wiki
{ pkgs, ... }:
let
  apps = import ../apps.nix { inherit pkgs; };
  configFile = with apps; let
    scratch-term-common = ''
      excludes = "*"
      unfocus = "hide"
      size = "50% 45%" # width height
      animation = "fromTop"
    '';
  in /* toml */ ''

    [pyprland]
    plugins = [ "scratchpads", "magnify" ]

    [scratchpads.term]
    lazy = false
    ${scratch-term-common}
    command = "${term} -t scratchpad-term"

    [scratchpads.system]
    lazy = true
    ${scratch-term-common}
    command = "${term} ${top}"

    [scratchpads.explorer]
    lazy = true
    ${scratch-term-common}
    command = "${term} ${file-manager-cli}"

  '';
in {
  home.packages = [ pkgs.pyprland ];
  xdg.configFile."hypr/pyprland.toml".text = configFile;

  programs.bash.initExtra = /* bash */ ''

    # INFO: Runs only on first instance (scratchpad terminal)
    LIVE_COUNTER=$(ps a | awk '{print $2}' | grep -vi "tty*" | uniq | wc -l);
    if [ $LIVE_COUNTER -eq 1 ]; then
      fastfetch
    fi

  '';
}
