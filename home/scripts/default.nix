{ pkgs, ... }:
{
  home.packages = [
    (import ./blocks.nix { inherit pkgs; })
  ];
}
