{ pkgs, ... }:

{
  home.packages = with pkgs; [
    winetricks  
    bottles-unwrapped
    wineWow64Packages.waylandFull
  ];
}
