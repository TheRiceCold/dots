{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # aseprite # INFO: Takes forever to build
    inkscape
    blender
    krita

    # gimp
  ];
}
