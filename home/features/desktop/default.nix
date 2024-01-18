{ inputs, pkgs, ... }:
{
  imports = [
    ./gtk
    ./wm/hyprland
    ./widgets/waybar.nix
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    dart-sass
    libnotify
    brightnessctl   # Brightness Control
    (python311.withPackages (p: [ 
      p.requests
      p.python-pam 
    ]))
  ];

  programs.ags = {
    enable = true;
    # configDir = ./ags;
    extraPackages = with pkgs; [ 
      vte
      libgtop
      playerctl
      libsoup_3 
      webkitgtk_4_1
      gtksourceview
    ];
  };
}
