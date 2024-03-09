{ pkgs, ... }:
let
  theme = "Catppuccin-Mocha-Compact-Lavender-Dark";
in {
  imports = [ ./hyprland ./apps ./ags.nix ];

  home = {
    sessionVariables = {
      GTK_THEME = theme;
      GTK_USE_PORTAL = "1";
    };
    pointerCursor = {
      size = 22;
      gtk.enable = true;
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
  };

  gtk = {
    enable = true;
    font.name = "Ubuntu Nerd Font";
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };

    theme = {
      name = theme;
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        tweaks = [ "rimless" ];
        size = "compact";
        variant = "mocha";
      };
    };
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
  };
}
