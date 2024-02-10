{ pkgs, ... }:
{
  imports = [
    ./apps
    ./ags
    ./gtk
    ./hyprland

    ./xdg.nix
    ./waybar.nix
    ./packages.nix
  ];

  home.pointerCursor = {
    size = 22;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      name = "Catppuccin-Mocha-Dark";
      package = pkgs.catppuccin-kde.override {
        flavour = [ "mocha" ];
        accents = [ "lavender" ];
      };
    };
  };
}
