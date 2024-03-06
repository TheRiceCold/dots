{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # aseprite # INFO: Extreamly slow build
    inkscape
    blender
    krita

    # gimp
  ];
}
