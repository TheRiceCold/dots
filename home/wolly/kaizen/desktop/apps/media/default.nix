{ pkgs, ... }:
{
  imports = [ ./spicetify.nix ];

  programs.mpv = {
    enable = true;
    config.gpu-context = "wayland";
    scripts = with pkgs.mpvScripts; [ mpris thumbnail ];
  };

  home.packages = with pkgs; [
    pavucontrol
    easyeffects
  ];
}
