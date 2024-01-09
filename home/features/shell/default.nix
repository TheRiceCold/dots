{ pkgs, ... }:

let
  aliases = {
    v = "lvim";
    x = "exit";
    c = "clear";
    rollback = "doas nixos-rebuild switch --rollback";
  };
in { 
  imports = [ 
    ./git.nix
    # ./bash.nix
    ./nushell.nix
    ./starship.nix
  ];

  home.packages = with pkgs; [
    zoxide
    direnv
    lazygit
  ];
}
