{ pkgs, ... }:

let
  run = key: app: "SUPER CTRL, ${key}, exec, ${app}";

  term = "${pkgs.foot}/bin/foot";
  alt-term = "${pkgs.kitty}/bin/kitty";
  file-manager-cli = "${pkgs.yazi}/bin/yazi";
  browser = "${pkgs.firefox-wayland}/bin/firefox";
in {
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER, b, exec, ${browser}"
    "SUPER, RETURN, exec, ${term}"
    "SUPER, e, exec, ${alt-term} ${file-manager-cli}"
    (run "v" "pavucontrol")
    (run "s" "hyprpicker -a")
    (run "w" "${term} --title floating nmtui")
  ];
}
