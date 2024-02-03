{ pkgs, ... }:
{
  imports = [ ./settings ];
  home = {
    sessionVariables = import ./variables.nix;
    packages = import ./packages.nix { inherit pkgs; };
  };
}
