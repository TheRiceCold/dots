{ inputs, pkgs, ... }:
{
  imports = [
    ./theme
    ./wm/hyprland
    ./widgets/waybar
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    dart-sass
    libnotify
    webkitgtk
    gtksourceview
    gtk-layer-shell
    brightnessctl   # Brightness Control
    (python311.withPackages (p: [ 
      p.requests
      p.python-pam 
    ]))
  ];

  programs.ags = {
    enable = true;
    # configDir = ./ags;
    extraPackages = [ pkgs.libsoup_3 ];
  };
}
