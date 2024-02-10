{ pkgs, ... }:
{
  programs.tmux = {
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [ catppuccin ];
    extraConfig = " set -g @catppuccin_flavour 'mocha' ";
  };
}
