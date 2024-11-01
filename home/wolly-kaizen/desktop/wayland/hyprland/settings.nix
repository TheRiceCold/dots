let
  rules = import ./rules.nix;
in {
  /* INFO: Options handled in kaizen hyprland batching:
    - decoration.borders, gaps, rounding, colors, shadows, blur
    - decoration.shaders(bluelight, vibrance, grayscale, invert, CRT)
    - general.layouts: (dwindle, master, scroll),
  */

  env = [
    "HYPRCURSOR_SIZE, 22"
    "HYPRCURSOR_THEME, Bibata-Modern-Ice"
  ];
  exec = ["pypr" "kaizen"];
  monitor = [",preferred,auto,1"];

  input = {
    kb_layout = "us";
    touchpad = {
      natural_scroll = true;
      disable_while_typing = true;
    };
  };

  general.resize_on_border = true;

  dwindle = {
    pseudotile = true;
    preserve_split = true;
  };

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

  animations = {
    enabled = true;
    first_launch_animation = true;

    bezier = [
      "wind, 0.05, 0.9, 0.1, 1.05"
      "winIn, 0.1, 1.1, 0.1, 1.1"
      "winOut, 0.3, -0.3, 0, 1"
      "liner, 1, 1, 1, 1"
    ];

    animation = [
      "windows, 1, 6, wind, slide"
      "windowsIn, 1, 6, winIn, slide"
      "windowsOut, 1, 5, winOut, slide"
      "windowsMove, 1, 5, wind, slide"
      "border, 1, 1, liner"
      "borderangle, 1, 30, liner, loop"
      "fade, 1, 10, default"
      "workspaces, 1, 5, wind"
    ];
  };

  decoration = {
    blur = {
      enabled = true;
      size = 8;
      passes = 3;
      xray = true;
      noise = 1.0e-2;
      contrast = 0.9;
      brightness = 0.8;
      ignore_opacity = true;
      new_optimizations = true;
    };

    active_opacity = 0.95;
    inactive_opacity = 0.85;

    shadow_range = 8;
    shadow_render_power = 2;
    "col.shadow" = "rgba(00000044)";
  };
}

