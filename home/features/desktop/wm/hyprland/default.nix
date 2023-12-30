{ pkgs, ... }:

{
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
      wayshot
      wf-recorder
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

  xdg.desktopEntries."org.gnome.Settings" = {
    name = "Settings";
    comment = "Gnome Control Center";
    icon = "org.gnome.Settings";
    exec = "env XDG_CURRENT_DESKTOP=gnome ${pkgs.gnome.gnome-control-center}/bin/gnome-control-center";
    categories = [ "X-Preferences" ];
    terminal = false;
  };
}
