{ inputs, pkgs, ... }:
{
  imports = [ ./settings ./pypr ];
  home = {
    sessionVariables = import ./variables.nix;
    packages = import ./packages.nix { inherit pkgs; };
  };
}
