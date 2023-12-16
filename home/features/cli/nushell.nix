{ pkgs, ... }:
{
  home.packages = [ pkgs.nushell ];
  programs.nushell = {
    enable = true;
  };
}
