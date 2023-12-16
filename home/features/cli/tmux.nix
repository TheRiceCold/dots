{ pkgs, ... }:
{
  home.packages = [ pkgs.tmux ];
  programs.tmux = {
    enable = true;
  };
}
