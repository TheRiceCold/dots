{ pkgs, ... }:

{
  imports = [ 
    ./bash.nix
    ./starship.nix
    ./tmux.nix
    ./nushell.nix
    ./neofetch
  ];

  home.packages = with pkgs; [
    zoxide
    direnv
    # ripgrep
    lazygit
    zellij
  ];
}
