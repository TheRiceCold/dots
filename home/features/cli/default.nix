{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zoxide
    direnv
    starship
    nushell
    ripgrep
    lazygit
    helix
    tmux
    zellij
  ];
}
