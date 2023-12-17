{ pkgs, ... }:
{
  home.packages = [ pkgs.nushell ];
  programs.nushell = {
    enable = true;
    shellAliases = {
      v = "lvim";
      x = "exit";
      c = "clear";
    };
  };
}
