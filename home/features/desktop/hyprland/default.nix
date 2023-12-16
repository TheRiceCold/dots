{ inputs, pkgs, ... }:

{
  imports = [  ];

  home = {
    packages = with pkgs; [
      waybar
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

      general = {
        gaps_in = 4;
        gaps_out = 4;
        border_size = 2;
        cursor_inactive_timeout = 4;
        "col.active_border" = "rgba(a28b35ff) 45deg";
        "col.inactive_border" = "0xff382d2e";
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

      decoration = {
        rounding = 4;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          ignore_opacity = true;
          new_optimizations = true;
        };
        drop_shadow = false;
        shadow_range = 10;
        shadow_offset = "1 2";
        "col.shadow" = "0x66404040";
        # "col.shadow_inactive" = "";
      };

      animations = {
        enabled = true;      
        bezier = [   
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      bind = let
        swaylock = "${pkgs.swaylock}/bin/swaylock";
        terminal = "${pkgs.foot}/bin/foot";
        browser = "${pkgs.firefox-wayland}/bin/firefox";
        launcher = "${pkgs.rofi-wayland}/bin/rofi";
      in [
        "SUPER, Q, killactive"
        "SUPERSHIFT, Q, exit"
        "SUPER, F, fullscreen, 1"
        "SUPER, T, togglefloating"
        "SUPER, RETURN, exec, ${terminal}"
        "SUPER, SPACE, exec, ${launcher} -show drun"
        "SUPER, b, exec, ${browser}"

        "SUPER, j, movefocus, d"
        "SUPER, k, movefocus, u"
        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"

        "SUPER, left, resizeactive, -40 0"
        "SUPER, right, resizeactive, 40 0"

        "SUPER, up, resizeactive, 0 -40"
        "SUPER, down, resizeactive, 0 40"

        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        "SUPERSHIFT, 1, movetoworkspacesilent, 1"
        "SUPERSHIFT, 2, movetoworkspacesilent, 2"
        "SUPERSHIFT, 3, movetoworkspacesilent, 3"
        "SUPERSHIFT, 4, movetoworkspacesilent, 4"
        "SUPERSHIFT, 5, movetoworkspacesilent, 5"
        "SUPERSHIFT, 6, movetoworkspacesilent, 6"
        "SUPERSHIFT, 7, movetoworkspacesilent, 7"
        "SUPERSHIFT, 8, movetoworkspacesilent, 8"
        "SUPERSHIFT, 9, movetoworkspacesilent, 9"
        "SUPERSHIFT, 0, movetoworkspacesilent, 10"      

        # Brightness control
        ",XF86MonBrightnessUp, exec, light -A 10"
        ",XF86MonBrightnessDown, exec, light -U 10"
      ];
    };
  };
}
