{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aseprite
    blender
    krita
  ];
}
