{ pkgs, ... }:
{
  home.packages = [ pkgs.joshuto ];
  programs.joshuto = {
    enable = true;
  };
}
