{ pkgs, ... }:
{
  programs.tmux = {
    mouse = true;
    keyMode = "vi";
    terminal = "xterm-256color";
    extraConfig = ''
      set -g @catppuccin_flavour 'mocha'
    '';
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      catppuccin
    ];
  };
}
