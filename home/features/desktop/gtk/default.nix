{ pkgs, ... }:

{
  home.pointerCursor = {
    size = 22;
    name = "Nordzy-cursors";
    package = pkgs.nordzy-cursor-theme;
  };

  gtk = {
    enable = true;
    font = {
      size = 11;
      name = "JetBrainsMono Nerd Font";
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };

    theme = {
      name = "Catppuccin-Mocha-Compat-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        size = "compact";
        variant = "mocha";
        accents = [ "lavender" ];
      };
    };

    cursorTheme = {
      size = 22;
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
    };
  };
}

