{ pkgs }: {
  top = "${pkgs.btop}/bin/btop";
  term = "${pkgs.foot}/bin/foot";
  pypr = "${pkgs.pyprland}/bin/pypr";
  file-manager-cli = "${pkgs.yazi}/bin/yazi";
  browser = "${pkgs.firefox-wayland}/bin/firefox";
  color-picker = "${pkgs.hyprpicker}/bin/hyprpicker";
  audio-control = "${pkgs.pavucontrol}/bin/pavucontrol";
}
