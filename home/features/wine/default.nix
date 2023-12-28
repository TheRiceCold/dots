{ pkgs, ... }:

{
  home.packages = with pkgs; [
    winetricks  
    wineWow64Packages.waylandFull
  ];
}
