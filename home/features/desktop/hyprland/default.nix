{ inputs, pkgs, ... }:

{
  imports = [  ];

  home.packages = with pkgs; [
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

  wayland.windowManager.hyprland = {
    enable = true; 
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    settings = {
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

      # animations = {
      #   enabled = true;      
      #   bezier = [   ];
      # };

      # bind = let
      #   swaylock = "${pkgs.swaylock}/bin/swaylock";
      #   terminal = "${pkgs.foot}/bin/foot";
      #   browser = "${pkgs.firefox-wayland}/bin/firefox";
      #   launcher = "${pkgs.rofi-wayland}/bin/rofi-wayland";
      # in [
      #   "SUPER, RETURN, exec, ${terminal}"
      #   "SUPER, b, exec, ${browser}"
      #   "SUPER, SPACE, exec ${launcher}"
      # ];
    };
  };
}
