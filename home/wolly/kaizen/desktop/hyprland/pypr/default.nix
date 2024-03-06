# DOCS: https://github.com/hyprland-community/pyprland/wiki
{ pkgs, ... }:
let
  apps = import ../apps.nix { inherit pkgs; };
  configFile = with apps; let
    scratchpad-term-common = ''
      excludes = "*"
      unfocus = "hide"
      size = "40% 40%" # width height
      animation = "fromTop"
    '';
  in /* toml */ ''

    [pyprland]
    plugins = [ "scratchpads", "magnify" ]

    [scratchpads.term]
    lazy = false
    ${scratchpad-term-common}
    command = "${footclient} -T scratchpad-term"

    [scratchpads.explorer]
    lazy = true
    ${scratchpad-term-common}
    command = "${footclient} -T scratchpad-term ${file-manager-cli}"

    [scratchpads.system]
    lazy = true
    size = "50% 50%"
    animation = "fromBottom"
    command = "${footclient} -T scratchpad-term ${top}"

  '';
in {
  xdg.configFile."hypr/pyprland.toml".text = configFile;
  home.packages = [ pkgs.pyprland ];
  programs.bash.initExtra = /* bash */ ''

    # Runs only on first instance (scratchpad terminal)
    LIVE_COUNTER=$(ps a | awk '{print $2}' | grep -vi "tty*" | uniq | wc -l);
    if [ $LIVE_COUNTER -eq 1 ]; then
      fastfetch
    fi

  '';
}
