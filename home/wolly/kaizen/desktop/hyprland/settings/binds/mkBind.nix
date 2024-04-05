{
  exec = key: cmd: "SUPER, ${key}, exec, ${cmd}";
  run-app = key: cmd: "SUPER_CTRL, ${key}, exec, ${cmd}";
  toggle = key: name: "SUPER_CTRL, ${key}, exec, pypr toggle ${name}";

  # WINDOW BINDINGS
  window = let
    bind = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
    bind-exec = exec: key: "${key},${exec}";
  in {
    pin = bind-exec "pin";
    kill = bind-exec "killactive";
    float = bind-exec "togglefloating";
    maximized = bind-exec "fullscreen, 1";
    fullscreen = bind-exec "fullscreen, 0";
    fakefullscreen =  bind-exec "fakefullscreen";

    center_layout = bind-exec "exec, pypr layout_center toggle";
    center_layout_up = bind-exec "exec, pypr layout_center prev";
    center_layout_down = bind-exec "exec, pypr layout_center next";

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
    cmd = val: "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ ${val}";
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

  # WIDGET BINDINGS
  ags = let
    bind = exec: key: "SUPER, ${key}, exec, ${exec}";
    toggle-window = win: bind "ags -t ${win}";
    js = run: bind '' ags -r "${run}" '';

    toggle-widget = win: name: js "toggleWidget('${win}', '${name}');";
    popup = toggle-widget "popup";
    sideleft = toggle-widget "sideleft";
    sideright = toggle-widget "sideright";
  in {
    overview = toggle-window "overview";
    launcher = toggle-window "launcher";
    shortcuts = toggle-window "shortcuts";
    powermenu = toggle-window "powermenu";

    media = popup "media";
    apis = sideleft "apis";
    colors = popup "colors";
    datemenu = sideright "datemenu";
    quicksettings = sideright "quicksettings";
  };
}
