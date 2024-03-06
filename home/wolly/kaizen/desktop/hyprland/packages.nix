{ pkgs, ... }: with pkgs; [
  swww            # Animated wallpaper Daemon
  slurp           # Region Selector
  hyprpicker      # Color Picker
  wl-screenrec    # Screen recorder
  wl-clipboard    # Clipboard Utility

  swayimg         # Image Viewer
  grimblast       # Grab Images
  swappy          # Snapshot Editing Tool

  # NOTE: Added, to be explored
  swaynotificationcenter # gtk based notification daemon

  # NOTE: For consideration
  # wl-mirror
  # wl-mirror-pick

  # Might be useful but, I don't need it.
  # cliphist        # Clipboard Manager
]
