{ inputs, pkgs, ... }:
let
  hyprland-contrib = inputs.hyprland-contrib.packages.${pkgs.system};
in with pkgs; with hyprland-contrib; [
  swww            # Animated wallpaper Daemon
  slurp           # Region Selector
  swayimg         # Image Viewer
  hyprpicker      # Color Picker
  cliphist        # Clipboard Manager
  wf-recorder     # Screen Record
  wl-clipboard    # Clipboard Utility
  # wl-mirror
  # wl-mirror-pick

  swappy          # Snapshot Editing Tool
  wshowkeys       # Display pressed keys

  # Hyprland Contrib Packages
  scratchpad      #
  grimblast       # Grab Images
]
