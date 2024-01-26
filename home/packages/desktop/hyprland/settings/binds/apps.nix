{ pkgs, ... }:

let
  run = key: app: "SUPER CTRL, ${key}, exec, ${app}";

  apps = {
    term = "${pkgs.foot}/bin/foot";
    alt-term = "${pkgs.kitty}/bin/kitty";
    file-manager-cli = "${pkgs.yazi}/bin/yazi";
    browser = "${pkgs.firefox-wayland}/bin/firefox";
    color-picker = "${pkgs.hyprpicker}/bin/hyprpicker";
    audio-control = "${pkgs.pavucontrol}/bin/pavucontrol";
  };
in {
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER, b, exec, ${apps.browser}"
    "SUPER, RETURN, exec, ${apps.term}"
    "SUPER, e, exec, ${apps.alt-term} ${apps.file-manager-cli}"

    (run "v" apps.audio-control)
    (run "c" "${apps.color-picker} -a")
    (run "w" "${apps.term} --title floating nmtui")
  ];
}
