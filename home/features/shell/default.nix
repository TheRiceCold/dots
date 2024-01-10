{ pkgs, ... }:

{ 
  imports = [ 
    ./git.nix
    ./bash.nix
    ./nushell.nix
    ./starship.nix
  ];

  home.packages = with pkgs; [
    zoxide
    direnv
    lazygit
  ];
}
