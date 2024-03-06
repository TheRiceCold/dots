{ pkgs, ... }:
{
  imports = [
    ./hyprland
    ./apps

    ./ags.nix
    ./gtk.nix
    ./fonts.nix
  ];

  qt = {
    enable = true;
    platformTheme = "qtct";
  };
}
