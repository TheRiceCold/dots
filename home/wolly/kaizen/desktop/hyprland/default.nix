{ pkgs, ... }: {

  imports = [ ./settings ./pypr ./ecosystem ];

  wayland.windowManager.hyprland.enable = true;

  home = {
    sessionVariables = import ./variables.nix;
    packages = with pkgs; [
      wtype             # Input simulator
      mpvpaper          # Video wallpaper
      # showmethekey

      wl-clipboard      # Clipboard Utility
      # cliphist        # Clipboard Manager. Useful but I need it.

      wl-mirror
      wl-gammarelay-rs

      wluma
      wlr-randr

      # flameshot
      # watershot
    ];
  };
}
