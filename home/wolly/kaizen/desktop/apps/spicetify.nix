{ inputs, pkgs, ... }:
let
  inherit (inputs) spicetify-nix;
in {
  imports = [ spicetify-nix.homeManagerModules.default ];
  programs.spicetify = {
    enable = true;
  };
}
