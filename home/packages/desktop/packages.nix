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
  home.packages = with pkgs; [
    # Fonts
    material-icons
    material-design-icons
    lexend
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    nerdfonts
    font-awesome

    # showmethekey
  ];

  home.file = {
    ".local/share/fonts" = {
      recursive = true;
      source = "${nerdfonts}/share/fonts/truetype/NerdFonts";
    };
    ".fonts" = {
      recursive = true;
      source = "${nerdfonts}/share/fonts/truetype/NerdFonts";
    };
  };
}
