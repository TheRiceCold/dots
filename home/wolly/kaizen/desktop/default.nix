{ pkgs, ... }:
{
  imports = [
    ./ags
    ./apps
    ./hyprland
    ./gtk.nix
    ./fonts.nix
  ];

  home.packages = with pkgs; [
    # bottles
    # wine-staging
  ];

  qt = {
    enable = true;
    platformTheme = "qtct";
  };
}
