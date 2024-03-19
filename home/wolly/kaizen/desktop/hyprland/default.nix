{ pkgs, ... }: {

  imports = [ ./settings ./pypr ./hyprlock ];
  home = {
    sessionVariables = import ./variables.nix;
    packages = with pkgs; [
      mpvpaper        # Video wallpaper
      swww            # Animated wallpaper Daemon
      slurp           # Region Selector
      hyprpicker      # Color Picker
      wl-screenrec    # Screen Recorder
      wl-clipboard    # Clipboard Utility

      grim            # Grab Images
      swayimg         # Image Viewer
      swappy          # Snapshot Editing Tool
      gromit-mpx      # Desktop Annotation Tool

      wl-mirror       # TODO: Learn to use

      # Might be useful but, I don't need it.
      # cliphist        # Clipboard Manager
    ];
  };
}
