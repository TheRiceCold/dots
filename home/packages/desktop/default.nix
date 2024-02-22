{ pkgs, ... }:
{
  imports = [
    ./apps
    ./ags
    ./gtk
    ./hyprland
    ./rofi.nix
    ./packages.nix
  ];

  home.pointerCursor = {
    size = 22;
    gtk.enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
  };
}
