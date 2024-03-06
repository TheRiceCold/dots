{ inputs, pkgs, ... }:
{
  imports = [ ./binds ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    settings = let
      rules = import ./rules.nix;
      apps = import ../apps.nix { inherit pkgs; };
    in {
      monitor = [ ",preferred,auto,1" ];
      exec = with apps; [ pypr "ags"  ];

      input = {
        kb_layout = "us";
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
        };
      };

      general = {
        layout = "dwindle";
        resize_on_border = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
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

      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
        workspace_swipe_numbered = true;
      };

      layerrule = rules.layer;
      windowrule = rules.window;
      windowrulev2 = rules.window2;

      animations = import ./animations.nix;
      decoration = import ./decoration.nix;
    };
  };
}
