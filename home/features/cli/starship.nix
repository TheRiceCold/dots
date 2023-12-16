{ pkgs, ... }:
{
  home.packages = [ pkgs.starship ];
  programs.starship = {
    enable = true;
  };
}
