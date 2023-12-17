{ pkgs, ... }:

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
      wlogout
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
}
