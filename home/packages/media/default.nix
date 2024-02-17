{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    config.gpu-context = "wayland";
    scripts = with pkgs.mpvScripts; [ mpris thumbnail ];
  };

  services.playerctld.enable = true;
  home.packages = with pkgs; [
    playerctl
    # cider2
    pavucontrol
    easyeffects
  ];
}
