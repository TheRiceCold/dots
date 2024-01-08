{ pkgs, ... }:

{
  home.packages = [ pkgs.zellij ];
  programs.zellij = {
    enable = true;
  };
}
