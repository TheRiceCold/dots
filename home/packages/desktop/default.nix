{ pkgs, ... }:
let
  nerdfonts = (pkgs.nerdfonts.override { fonts = [
    "Ubuntu"
    "UbuntuMono"
    "CascadiaCode"
    "FantasqueSansMono"
    "FiraCode"
    "Mononoki"
  ]; });
in {
  imports = [
    ./ags
    ./gtk
    ./hyprland
    ./waybar.nix
  ];

  xdg.mimeApps = {
    enable = true;

    defaultApplications = let
      browser = "firefox.desktop";
      imageView = "swayimg";
    in {
      "x-scheme-handler/http" = [browser];
      "x-scheme-handler/https" = [browser];
      "application/xhtml+xml" = [browser];
      "text/html" = [browser];
      "text/xml" = [browser];

      "image/jpeg" = [imageView];
      "image/bmp" = [imageView];
      "image/gif" = [imageView];
      "image/jpg" = [imageView];
      "image/pjpeg" = [imageView];
      "image/png" = [imageView];
      "image/tiff" = [imageView];
      "image/webp" = [imageView];
      "image/x-bmp" = [imageView];
      "image/x-gray" = [imageView];
      "image/x-icb" = [imageView];
      "image/x-ico" = [imageView];
      "image/x-png" = [imageView];
      "image/x-portable-anymap" = [imageView];
      "image/x-portable-bitmap" = [imageView];
      "image/x-portable-graymap" = [imageView];
      "image/x-portable-pixmap" = [imageView];
      "image/x-xbitmap" = [imageView];
      "image/x-xpixmap" = [imageView];
      "image/x-pcx" = [imageView];
      "image/svg+xml" = [imageView];
      "image/svg+xml-compressed" = [imageView];
      "image/vnd.wap.wbmp" = [imageView];
      "image/x-icns" = [imageView];
    };
  };


  home = {
    packages = with pkgs; [ 
      material-icons
      material-design-icons
      lexend
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji

      nerdfonts 
      font-awesome

      showmethekey
    ];

    file = {
      ".local/share/fonts" = {
        recursive = true;
        source = "${nerdfonts}/share/fonts/truetype/NerdFonts";
      };
      ".fonts" = {
        recursive = true;
        source = "${nerdfonts}/share/fonts/truetype/NerdFonts";
      };
    };

    pointerCursor = {
      size = 22;
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
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
