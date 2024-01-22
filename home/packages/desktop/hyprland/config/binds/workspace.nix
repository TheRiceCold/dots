let
  arr = [1 2 3 4 5 6 7 8 9];
  b = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
in {
  wayland.windowManager.hyprland.settings.bind = let
    ws = b "SUPER" "workspace";
    mvfocus = b "SUPER" "movefocus";
    mvactive = b "SUPER ALT" "moveactive";
    swapwindow = b "SUPERSHIFT" "swapwindow";
    resizeactive = b "SUPER CTRL" "resizeactive";
    mvtows =  b "SUPERSHIFT" "movetoworkspacesilent";
  in [
    "SUPER, q, killactive"

    "SUPER, t, togglefloating"
    "SUPER, f, fullscreen, 1"
    "SUPERSHIFT, f, fullscreen, 0"
    "SUPERALT, f, fakefullscreen"

    "SUPER, p, pin"
    "SUPER, g, togglegroup"
    "SUPER, s, togglespecialworkspace"

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

    (mvactive "k" "0 -30")
    (mvactive "j" "0 30")
    (mvactive "l" "30 0")
    (mvactive "h" "-30 0")
  ] ++ (map (i: mvtows (toString i) (toString i)) arr) 
  ++ (map (i: ws (toString i) (toString i)) arr);
}
