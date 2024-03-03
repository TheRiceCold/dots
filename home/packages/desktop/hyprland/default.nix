{ inputs, pkgs, ... }:
{
  imports = [ ./settings ./pypr.nix ];
  home = {
    sessionVariables = import ./variables.nix;
    packages = import ./packages.nix { inherit inputs pkgs; };
  };
}
