{ pkgs, ... }:

let
  theme = "Catppuccin-Mocha-Compact-Lavender-Dark";
in {
  home.sessionVariables.GTK_THEME = theme; 

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
        size = "compact";
        # tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
  };
}

