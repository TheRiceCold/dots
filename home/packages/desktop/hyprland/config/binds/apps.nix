{ pkgs, ... }:

let
  run = key: app: "SUPER CTRL, ${key}, exec, ${app}";

  term = "${pkgs.foot}/bin/foot";
  alt-term = "${pkgs.kitty}/bin/kitty";
  browser = "${pkgs.firefox-wayland}/bin/firefox";
in {
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER, b, exec, ${browser}"
    "SUPER, RETURN, exec, ${term}"
    (run "v" "pavucontrol")
    (run "s" "hyprpicker -a")
    (run "w" "${term} --title floating nmtui")
    "SUPER, e, exec, ${alt-term} --title floating yazi"
    # "SUPER, e, exec, foot --window-size-pixels=1000x800 --title=floating yazi"
  ];
}
