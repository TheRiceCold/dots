{ inputs, pkgs, ... }:

let
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
in {
  imports = [ ./config ];

  home = {
    packages = with pkgs; [
      swww            # Wallpaper Daemon
      slurp           # Region Selector
      grimblast       # Grab Images
      swayimg         # Image Viewer
      hyprpicker      # Color Picker
      wlogout
      swaylock        # Lock Screen
      wl-clipboard    # Clipboard
      cliphist        # Clipboard Manager
    ];

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      __GR_VRR_ALLOWED = "0";
      __GR_GSYNC_ALLOWED = "0";
      SDL_VIDEODRIVER = "wayland";

      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_CURRENT_DESKTOP = "Hyprland";

      GDK_BACKEND = "wayland";

      _JAVA_AWT_WM_NONREPARENTING = "1";

      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_SCALE_FACTOR = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR  = "1";

      DISABLE_QT5_COMPAT = "0";
      CLUTTER_BACKEND = "wayland";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true; 
    package = hyprland;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      monitor = [ ",preferred,auto,1" ];

      exec = [
        "wl-paste --watch cliphist store"
        "swww init"
        "waybar"
        "ags"
      ];

      input = {
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
        };
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

  xdg.desktopEntries."org.gnome.Settings" = {
    name = "Settings";
    comment = "Gnome Control Center";
    icon = "org.gnome.Settings";
    exec = "env XDG_CURRENT_DESKTOP=gnome ${pkgs.gnome.gnome-control-center}/bin/gnome-control-center";
    categories = [ "X-Preferences" ];
    terminal = false;
  };
}
