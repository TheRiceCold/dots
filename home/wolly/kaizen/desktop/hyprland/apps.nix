{ pkgs }: {
  top = "${pkgs.btop}/bin/btop";
  pypr = "${pkgs.pyprland}/bin/pypr";
  foot = "${pkgs.foot}/bin/foot";
  footclient= "${pkgs.foot}/bin/footclient";
  file-manager-cli = "${pkgs.yazi}/bin/yazi";
  browser = "${pkgs.firefox-wayland}/bin/firefox";
  color-picker = "${pkgs.hyprpicker}/bin/hyprpicker";
  audio-control = "${pkgs.pavucontrol}/bin/pavucontrol";
}
