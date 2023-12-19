{ inputs, pkgs, ... }:
let
  topbar = "${pkgs.waybar}/bin/waybar";
  wallpaper = "${pkgs.swww}/bin/swww init";
in {
  imports = [
    ./binds.nix
    ./windows.nix
    ./animations.nix
    ./decoration.nix
  ];

  home.sessionVariables = {
    GDK_BACKEND = "wayland;x11";
    QT_QPA_PLATFORM = "wayland,xcb";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_CURRENT_DESKTOP = "Hyprland";
  };

  wayland.windowManager.hyprland = {
    enable = true; 
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    settings = {
      monitor = ",preferred,auto,1";
      # monitor = "eDP-1,1920x1080@60,0x0,1";

      exec = [ 
        topbar 
        wallpaper 
        "wl-paste --watch cliphist store"
      ];

      input = {
        kb_layout = "us";
        touchpad.natural_scroll = true;
      };

      dwindle = {
        force_split = 0;
        no_gaps_when_only = false;
        special_scale_factor = 0.8;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
      };

      master = {
        new_is_master = true;
        no_gaps_when_only = false;
        special_scale_factor = 0.8;
      };

      misc = {
        disable_hyprland_logo = true;
        animate_manual_resizes = true;
        new_window_takes_over_fullscreen = 2;
      };
    };
  };
}
