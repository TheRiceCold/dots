{pkgs, ...}: let
  cursorTheme = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
  };
in {
  home = {
    sessionVariables = {GTK_USE_PORTAL = "1";};
    pointerCursor = {
      size = 22;
      gtk.enable = true;
      inherit (cursorTheme) name package;
    };
  };

  gtk = {
    enable = true;
    font.name = "Ubuntu Nerd Font";
    theme = {
      name = "WhiteSur-Dark";
      package = pkgs.whitesur-gtk-theme;
    };
    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
  };

  qt.enable = true;
  qt.platformTheme.name = "qtct";
}
