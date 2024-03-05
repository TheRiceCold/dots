{ inputs, pkgs, ... }:
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
    nerdfonts
    font-awesome
    cantarell-fonts
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
