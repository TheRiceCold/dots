{ pkgs, ... }:
{
  imports = [
    ./ags
    ./gtk
    ./hyprland
    ./waybar.nix
  ];

  home = {
    packages = [
      (pkgs.nerdfonts.override { 
        fonts = [ "Ubuntu" "FiraCode" "UbuntuMono" ];
      }) 
    ];

    pointerCursor = {
      size = 22;
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
  };
}
