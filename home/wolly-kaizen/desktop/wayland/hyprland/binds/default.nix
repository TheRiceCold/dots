{ pkgs, ... }: let
  apps = with import ../../../apps/get-apps.nix pkgs; [
    "SUPER, Return, exec, [tile] ${term}"
    "SUPER, b, exec, [workspace 2] qutebrowser"
    "SUPER SHIFT, b, exec, [workspace 2] qutebrowser --target private-window"
  ];
in {
  wayland.windowManager.hyprland = {
    settings = {
      bind = let
        numbers = [1 2 3 4 5 6 7 8 9 0]; # Number of workspaces
        workspace = num: "SUPER, ${toString num}, workspace, ${toString num}";
        move-to-workspace = num: "SUPER SHIFT, ${toString num}, movetoworkspace, ${toString num}";
      in [
          "SUPER SHIFT, q, exit" # Exit Hyprland

          # Window state
          "SUPER, q, killactive"
          "SUPER, t, togglefloating"
          "SUPER SHIFT, p, pin"
          "SUPER, f, fullscreen, 0"
          "SUPER, m, fullscreen, 1" # Maximized
          "SUPER SHIFT, f, fullscreenstate, -1 2" # Fake Fullscreen

          # plugins
          # "SUPER, grave, overview:toggle"
        ]
        ++ map move-to-workspace numbers
        ++ map workspace numbers
        ++ apps;

      bindm = ["SUPER, mouse:272, movewindow" "SUPER, mouse:273, resizewindow"];

      binde = let
        volume-value = 5;
        brightness-value = 5;
        volume-cmd = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ ${toString volume-value}%";
      in [
        ",XF86MonBrightnessUp, exec, light -A ${toString brightness-value}"
        ",XF86MonBrightnessDown, exec, light -U ${toString brightness-value}"

        ",XF86AudioRaiseVolume, exec, ${volume-cmd}+"
        ",XF86AudioLowerVolume, exec, ${volume-cmd}-"
      ];

      bindl = [
        ",XF86AudioPrev, exec, playerctl next"
        ",XF86AudioPrev, exec, playerctl previous"
        ",XF86AudioPrev, exec, playerctl play-pause"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
    };
    extraConfig = import ./basic-layout-binds.nix;
  };
}

