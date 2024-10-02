{ pkgs, ... }:
{

  imports = [ ./hyprland ];

  home = {
    packages = with pkgs; [
      wtype # Input simulator

      swayimg
      wlr-randr
      wl-clipboard # Clipboard Utility

      # For consideration
      # wluma
      wl-mirror
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

      QT_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

      DISABLE_QT5_COMPAT = "0";
      CLUTTER_BACKEND = "wayland";
    };
  };
}
