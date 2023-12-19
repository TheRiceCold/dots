{ lib, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    bind = let 
      swaylock = "${pkgs.swaylock}/bin/swaylock";
      workspaces = [ 
        "0" "1" "2" "3" "4" "5" "6" "7" "8" "9"
        "F1" "F2" "F3" "F4" "F5" "F6" "F7" "F8" "F9" "F10" "F11" "F12"
      ];
      # Map keys (arrows and hjkl) to hyprland directions (l, r, u, d)
      directions = rec {
        up = "u"; down = "d"; left = "l"; right = "r";
        k = up; j = down; h = left; l = right;
      };
    in [
      "SUPERSHIFT, q, exit"
      "SUPER, q, killactive"

      "SUPER, y, pin"
      "SUPER, s, togglesplit"
      "SUPER, t, togglefloating"
      "SUPER, f, fullscreen, 1"
      "SUPERSHIFT, f, fullscreen, 0"

      "SUPER, g, togglegroup"

      "SUPER, b, exec, firefox"
      "SUPER, RETURN, exec, foot"
      "SUPER, e, exec, foot joshuto"
      "SUPER, SPACE, exec, pkill rofi || rofi -show drun"
      "SUPER, o, exec, killall -SIGUSR1 .waybar-wrapped"

      "SUPER, left, resizeactive, -40 0"
      "SUPER, right, resizeactive, 40 0"

      "SUPER, up, resizeactive, 0 -40"
      "SUPER, down, resizeactive, 0 40"

      # Brightness control
      ",XF86MonBrightnessUp, exec, light -A 10"
      ",XF86MonBrightnessDown, exec, light -U 10"

      # Volume control
      ",XF86AudioRaiseVolume,exec, pamixer -i 5"
      ",XF86AudioLowerVolume,exec, pamixer -d 5"
      ",XF86AudioMute,exec, pamixer -t"
      ",XF86AudioMicMute,exec, pamixer --default-source -t"

    ] ++
    # Change workspace
    (map (n: "SUPER, ${n}, workspace, name:${n}") workspaces) ++
    # Move window to workspace
    (map (n: "SUPERSHIFT, ${n}, movetoworkspacesilent, name:${n}") workspaces) ++
    # Move focus
    (lib.mapAttrsToList (key: direction: "SUPER, ${key}, movefocus, ${direction}") directions) ++
    # Move windows
    (lib.mapAttrsToList (key: direction: "SUPERSHIFT, ${key}, swapwindow, ${direction}") directions);
  };
}
