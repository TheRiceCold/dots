{ pkgs, ... }: {
  imports = [ ./hyprland ./apps ./ags.nix ];

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
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
  };
}
