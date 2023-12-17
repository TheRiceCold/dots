{ pkgs, ... }:

{
  imports = [ 
    ./git.nix
    ./bash.nix
    ./nushell.nix
  ];

  home.packages = with pkgs; [
    zoxide
    direnv
    lazygit
    zellij
  ];
}
