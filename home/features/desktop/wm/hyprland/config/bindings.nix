{ lib, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    bindle = [
      # Brightness control
      ",XF86MonBrightnessUp, exec, light -A 10"
      ",XF86MonBrightnessDown, exec, light -U 10"
      # Volume control
      ",XF86AudioRaiseVolume, exec, pamixer -i 5"
      ",XF86AudioLowerVolume, exec, pamixer -d 5"
    ];

    bindl = [
      ",XF86AudioMute,exec, pamixer -t"
      ",XF86AudioMicMute,exec, pamixer --default-source -t"
    ];

    bind = let 
      binding = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
      arr = [1 2 3 4 5 6 7 8 9];
      ws = binding "SUPER" "workspace";
      mvfocus = binding "SUPER" "movefocus";
      mvactive = binding "SUPER ALT" "moveactive";
      swapwindow = binding "SUPERSHIFT" "swapwindow";
      resizeactive = binding "SUPER CTRL" "resizeactive";
      mvtows = binding "SUPERSHIFT" "movetoworkspacesilent";
    in [
      "SUPERSHIFT, q, exit"
      "SUPER, q, killactive"

      "SUPER, t, togglefloating"
      "SUPER, f, fullscreen, 1"
      "SUPERSHIFT, f, fullscreen, 0"
      "SUPERALT, f, fakefullscreen"

      "SUPER, g, togglegroup"

      "SUPER, b, exec, firefox"
      "SUPER, RETURN, exec, foot"
      "SUPER, e, exec, foot joshuto"
      "SUPER, SPACE, exec, ags -t applauncher"

      (mvfocus "k" "u")
      (mvfocus "j" "d")
      (mvfocus "l" "r")
      (mvfocus "h" "l")

      (swapwindow "k" "u")
      (swapwindow "j" "d")
      (swapwindow "l" "r")
      (swapwindow "h" "l")

      (resizeactive "k" "0 -20")
      (resizeactive "j" "0 20")
      (resizeactive "l" "20 0")
      (resizeactive "h" "-20 0")

      (mvactive "k" "0 -20")
      (mvactive "j" "0 20")
      (mvactive "l" "20 0")
      (mvactive "h" "-20 0")
    ] ++
    # Change workspace
    (map (i: ws (toString i) (toString i)) arr) ++
    (map (i: mvtows (toString i) (toString i)) arr);
  };
}
