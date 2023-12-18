{ pkgs, ... }:
{
  home.packages = [ pkgs.tmux ];
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    terminal = "xterm-256color";
    extraConfig = ''

    '';
    plugins = with pkgs; [
      tmuxPlugins.resurrect
    ];
  };
}
