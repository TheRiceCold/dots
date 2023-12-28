{ inputs, pkgs, ... }:

let
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
in {
  imports = [
    ./plugins.nix
    ./windows.nix
    ./bindings.nix
    ./animations.nix
    ./decoration.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true; 
    package = hyprland;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      monitor = [ ",preferred,auto,1" ];

      exec = [
        "wl-paste --watch cliphist store"
        "swww init"
        "waybar"
        "ags"
      ];

      input = {
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
        };
      };

      dwindle = {
        force_split = 0;
        no_gaps_when_only = false;
        special_scale_factor = 0.8;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
      };

      master = {
        new_is_master = true;
        no_gaps_when_only = false;
        special_scale_factor = 0.8;
      };

      misc = {
        disable_hyprland_logo = true;
        animate_manual_resizes = true;
        new_window_takes_over_fullscreen = 2;
      };
    };
  };
}
