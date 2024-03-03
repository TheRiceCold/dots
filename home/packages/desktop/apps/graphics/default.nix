{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # figma-linux
    # aseprite
    inkscape
    blender
    krita
    # gimp
  ];
}
