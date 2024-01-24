{
  imports = [
    ./binds
    ./rules
    # ./plugins.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true; 
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      monitor = [ ",preferred,auto,1" ];

      animations = import ./animations.nix;
      decoration = import ./decoration.nix;

      exec = [
        # "wl-paste --type text --watch cliphist store"
        # "wl-paste --type image --watch cliphist store"
        "swww init"
        "ags"
      ];

      input = {
        kb_layout = "us";
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
        };
      };

      general = {
        gaps_in = 4;
        gaps_out = 4;
        border_size = 2;
        cursor_inactive_timeout = 4;
        "col.active_border" = "rgba(5529a5FF)";
        "col.inactive_border" = "rgba(4b4358AA)";
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
