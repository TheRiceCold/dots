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
    ];

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      __GR_VRR_ALLOWED = "0";
      __GR_GSYNC_ALLOWED = "0";

      _JAVA_AWT_WM_NONREPARENTING = "1";

      QT_SCALE_FACTOR = "1";
    };
  };
}
