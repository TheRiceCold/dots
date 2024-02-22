{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # figma-linux
    # aseprite
    blender
    krita
    gimp
  ];
}
