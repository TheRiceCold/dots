{ pkgs, ... }:
{
  imports = [ ./krita.nix ./inkscape.nix ];

  home.packages = with pkgs; [
    gimp        # Image Maniputation
    blender     # 3d Graphics
    libresprite # Pixel Art
  ];
}
