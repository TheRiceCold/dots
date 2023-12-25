{ inputs, pkgs, ... }:
{
  imports = [
    ./windows.nix
    ./bindings.nix
    ./animations.nix
    ./decoration.nix
  ];
}
