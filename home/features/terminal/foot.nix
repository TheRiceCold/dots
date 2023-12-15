{ pkgs, ... }:
{
  home.packages = [ pkgs.foot ];
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "JetBrainsMonoNerdFont:size=12";
      };
      cursor = {
        blink = false;
        style = "block";
      };
    };
  };
}
