{ inputs, pkgs, ... }:
{
  imports = [ ./settings ./pypr ./hyprlock ];
  home = {
    sessionVariables = import ./variables.nix;
    packages = import ./packages.nix { inherit pkgs; };
  };
}
