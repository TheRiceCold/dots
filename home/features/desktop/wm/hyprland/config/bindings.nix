{
  wayland.windowManager.hyprland.settings = {
    bindm = [ "SUPER, mouse:272, movewindow" "SUPER, mouse:273, resizewindow" ];

    binde = let
      v = key: exec: ",XF86Audio${key}Volume, exec, ${exec}";
      b = key: exec: ",XF86MonBrightness${key}, exec, ${exec}";
      i = "ags -r 'indicator.popup(1);'";
    in [
      (b "Up" "light -A 10") (b "Up" i) 
      (b "Down" "light -U 10") (b "Down" i) 

      (v "Raise" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+") (v "Raise" i)
      (v "Lower" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-") (v "Lower" i)
    ];

    bindr = [ "SUPERSHIFT, f, exec, pkill ags || ags" ];
    bindl = [ ",XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle" ];

    bind = let 
      b = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
      arr = [1 2 3 4 5 6 7 8 9];
      ws = b "SUPER" "workspace";
      mvfocus = b "SUPER" "movefocus";
      mvactive = b "SUPER ALT" "moveactive";
      swapwindow = b "SUPERSHIFT" "swapwindow";
      resizeactive = b "SUPER CTRL" "resizeactive";
      mvtows =  b "SUPERSHIFT" "movetoworkspacesilent";
    in [
      "SUPERSHIFT, q, exit"
      "SUPER, q, killactive"

      "SUPER, t, togglefloating"
      "SUPER, f, fullscreen, 1"
      "SUPERSHIFT, f, fullscreen, 0"
      "SUPERALT, f, fakefullscreen"

      "SUPER, g, togglegroup"
      "SUPER, s, togglespecialworkspace"

      "SUPER, b, exec, firefox"
      "SUPER, RETURN, exec, foot"
      "SUPER, e, exec, kitty joshuto"
      "SUPERSHIFT, c, exec, hyprpicker -a"
      "ControlSuper, v, exec, pavucontrol"

      # AGS keybinds
      "SUPER, a, exec, ags -t sideleft"
      "SUPER, Tab, exec, ags -t overview"
      "SUPER, Space, exec, ags -t launcher"
      "SUPER, Slash, exec, ags -t cheatsheet"

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
    ] ++
    # Change workspace
    (map (i: ws (toString i) (toString i)) arr) ++
    (map (i: mvtows (toString i) (toString i)) arr);
  };
}
