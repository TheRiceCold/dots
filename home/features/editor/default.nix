{ pkgs, ... }:
{
  # imports = [ ./helix.nix ];

  home.packages = with pkgs; [ 
    # lunarvim 
    # emacs
    # vscodium
  ];
}
