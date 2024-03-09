{ inputs, pkgs, ... }: {

  imports = [ ./settings ./pypr ./hyprlock ];
  home = {
    sessionVariables = import ./variables.nix;
    packages = with pkgs; [
      swww            # Animated wallpaper Daemon
      slurp           # Region Selector
      hyprpicker      # Color Picker
      wl-screenrec    # Screen recorder
      wl-clipboard    # Clipboard Utility

      swayimg         # Image Viewer
      grimblast       # Grab Images
      swappy          # Snapshot Editing Tool

      # NOTE: For consideration
      # wl-mirror
      # wl-mirror-pick

      # Might be useful but, I don't need it.
      # cliphist        # Clipboard Manager
    ];
  };
}
