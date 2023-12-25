{ inputs, pkgs, ... }:
{
  imports = [
    ./wm/hyprland
    ./widgets/waybar
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    sassc
    brightnessctl   # Brightness Control
    (python311.withPackages (p: [ p.python-pam ]))
  ];

  programs.ags = {
    enable = true;
    # configDir = ./ags;
    extraPackages = [ pkgs.libsoup_3 ];
  };
}
