{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    package = pkgs.tmux;
    terminal = "xterm-256color";
    extraConfig = ''

    '';
    plugins = with pkgs; [
      tmuxPlugins.resurrect
    ];
  };
}
