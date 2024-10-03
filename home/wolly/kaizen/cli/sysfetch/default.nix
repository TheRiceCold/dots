{ pkgs, ... }: {
  imports = [./fastfetch.nix];
  home.packages = [pkgs.onefetch];
}
