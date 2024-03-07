{
  exec = key: cmd: "SUPER, ${key}, exec, ${cmd}";
  ags = key: win: "SUPER, ${key}, exec, ags -t ${win}";
  run-app = key: cmd: "SUPER_CTRL, ${key}, exec, ${cmd}";
  toggle = key: name: "SUPER_CTRL, ${key}, exec, pypr toggle ${name}";

  # WINDOW BINDINGS
  window = let
    bind = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
  in {
    pin = key: "${key}, pin";
    kill = key: "${key}, killactive";
    float = key: "${key}, togglefloating";
    maximized = key: "${key}, fullscreen, 1";
    fullscreen = key: "${key}, fullscreen, 0";
    fakefullscreen = key: "${key}, fakefullscreen";

    focus = bind "SUPER" "movefocus";
    move = bind "SUPER_ALT" "moveactive";
    swap = bind "SUPER_SHIFT" "swapwindow";
    resize = bind "SUPER_CTRL" "resizeactive";
  };

  media = let
    mute = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
    bind = key: exec: ",XF86Audio${key}, exec, ${exec}";
  in {
    mute = bind "Mute" mute;
    # stop = bind "Stop" "";
    # mic-mute = bind "MicMute" "";
    next = bind "Next" "playerctl next";
    prev = bind "Prev" "playerctl previous";
    play = bind "Play" "playerctl play-pause";
  };

  # INDICATOR BINDINGS
  volume = let
    cmd = val: "wpctl set-volume @DEFAULT_AUDIO_SINK@ ${val}";
    bind = key: val: ",XF86Audio${key}Volume, exec, ${cmd val}";
  in {
    up-value = val: bind "Raise" "${val}%+";
    down-value = val: bind "Lower" "${val}%-";
  };

  brightness = let
    cmd = key: val: "light ${if key == "Up" then "-A" else "-U"} ${val}";
    bind = key: val: ",XF86MonBrightness${key}, exec, ${cmd key val}";
  in {
    up-value = bind "Up";
    down-value = bind "Down";
  };
}
