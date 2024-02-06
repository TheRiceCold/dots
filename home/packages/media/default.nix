{ pkgs, ... }:
{
  imports = [
    ./mpv.nix
    ./playerctl.nix
    # ./amberol.nix
    # ./g4music.nix
  ];

  home.packages = with pkgs; [
    # cider2
    pavucontrol
    easyeffects
  ];
}
