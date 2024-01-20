{ pkgs, ... }:
{
  home.packages = with pkgs; [
    krita
    blender
    aseprite
  ];
}
