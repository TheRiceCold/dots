{ pkgs, ... }: let
  theme = {
    name = "Matcha-dark-sea";
    package = pkgs.matcha-gtk-theme;
  };
in {
  imports = [ ./hyprland ./apps ];

  home = {
    sessionVariables = {
      GTK_USE_PORTAL = "1";
    };
    pointerCursor = {
      size = 22;
      gtk.enable = true;
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
    file.".local/share/themes".source = "${theme.package}/share/themes";
  };

  gtk = {
    enable = true;
    theme.name = theme.name;
    font.name = "Ubuntu Nerd Font";
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
  };
}
