{ pkgs, ... }:
{
  imports = [ ./helix.nix ];

  home.packages = pkgs; [ 
    lunarvim 
    # emacs
    # vscodium
  ];
}
