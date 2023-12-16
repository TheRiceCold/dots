{ inputs, pkgs, ... }:

{
  imports = [ 
    ./config 
    ./waybar
  ];

  home = {
    packages = with pkgs; [
      rofi-wayland    # App Launcher

      hyprpicker      # Color Picker
      swww            # Wallpaper Daemon
      swayimg         # Image Viewer
      grimblast       # Grab Images
      slurp           # Region Selector
      swaylock        # Lock Screen
      swappy          # Snapshot Editor
      wl-clipboard    # Clipboard
      cliphist        # Clipboard Manager

      firefox-wayland # Browser
    ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      __GR_VRR_ALLOWED = "0";
      __GR_GSYNC_ALLOWED = "0";
      SDL_VIDEODRIVER = "wayland";

      DEFAULT_BROWSER = "${pkgs.firefox-wayland}/bin/firefox";

      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_CURRENT_DESKTOP = "Hyprland";

      GDK_BACKEND = "wayland";
      MOZ_ENABLE_WAYLAND = "1";

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
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    settings = {
      monitor = "eDP-1,1920x1080@60,0x0,1";

      exec = [
        "${pkgs.swww}/bin/swww init"
        "${pkgs.waybar}/bin/waybar"
      ];

      input = {
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
        };
      };

      dwindle = {
        no_gaps_when_only = false;
        force_split = 0;
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

      # windowrule = [ "float rofi" "float pavucontrol" ];

      layerrule = [ "blur,waybar" ];

      blurls = [ "waybar" "lockscreen" ];
    };
  };
}
