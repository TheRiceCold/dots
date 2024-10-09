let
  rules = import ./rules.nix;
in
{
  env = [
    "HYPRCURSOR_SIZE, 22"
    "HYPRCURSOR_THEME, Bibata-Modern-Ice"
  ];
  monitor = [ ",preferred,auto,1" ];
  exec = [ "pypr" "kaizen" "hypridle" ];

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

  dwindle.pseudotile = true;
  dwindle.preserve_split = true;

  master = {
    special_scale_factor = 0.8;
  };

  misc = {
    vfr = true;
    disable_hyprland_logo = true;
    animate_manual_resizes = true;
    font_family = "Ubuntu Nerd Font";
    new_window_takes_over_fullscreen = 2;
  };

  gestures = {
    workspace_swipe = true;
    workspace_swipe_forever = true;
  };

  cursor = {
    no_warps = true;
    # persistent_warps = true;
    enable_hyprcursor = true;
  };

  layerrule = rules.layer;
  windowrule = rules.window;
  windowrulev2 = rules.window2;

  animations = import ./animations.nix;
  decoration = import ./decoration.nix;
}
