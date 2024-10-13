{ pkgs, ... }: let
  window-state = [
    "SUPER, q, killactive"
    "SUPER, t, togglefloating"
    "SUPER SHIFT, p, pin"
    "SUPER, f, fullscreen, 0"
    "SUPER, m, fullscreen, 1" # Maximized
    "SUPER SHIFT, f, fullscreenstate, -1 2" # Fake Fullscreen
  ];
  apps = with import ../../../apps/get-apps.nix pkgs; [
    "SUPER, Return, exec, [tile] ${term}"
    "SUPER CTRL, t, exec, ${pypr} toggle term"
    "SUPER, b, exec, [workspace 2] ${browser} --browser-window"
  ];
in {
  wayland.windowManager.hyprland = {
    # extraConfig = import ./basic-layout-binds.nix;
    extraConfig = import ./scroll-layout-binds.nix;
    settings = {
      bind = let
        numbers = [1 2 3 4 5 6 7 8 9 0]; # Number of workspaces
        workspace = num: "SUPER, ${toString num}, workspace, ${toString num}";
        move-to-workspace = num: "SUPER SHIFT, ${toString num}, movetoworkspace, ${toString num}";
      in
        ["SUPER SHIFT, q, exit"] # Exit Hyprland
        ++ map move-to-workspace numbers
        ++ map workspace numbers
        ++ window-state
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
    };
  };
}
