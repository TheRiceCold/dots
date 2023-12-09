{ lib, ... }:

with lib;
{
  options = {
  # Display Servers
    x11wm = {                   # Condition if host uses an X11 window manager
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
    wlwm = {                    # Condition if host uses a wayland window manager
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };

  # Window Managers
    hyprland = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };
}
