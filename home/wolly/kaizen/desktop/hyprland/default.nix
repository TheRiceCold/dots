{ pkgs, ... }: {

  imports = [ ./settings ./pypr ./hyprlock ];
  home = {
    sessionVariables = import ./variables.nix;
    packages = with pkgs; [
      wtype             # Input simulator
      mpvpaper          # Video wallpaper

      # Might be useful but, I don't need it.
      # cliphist        # Clipboard Manager

      # TODO: Learn to use, and install hyprshade
      wl-mirror
      wl-gammarelay-rs
    ];
  };
}
