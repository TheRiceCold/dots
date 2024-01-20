{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      gpu-context = "wayland";
    };
    scripts = with pkgs.mpvScripts; [ mpris thumbnail ];
  };
}
