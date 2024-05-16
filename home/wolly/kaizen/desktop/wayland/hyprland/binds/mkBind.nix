{
  exec = key: cmd: "SUPER, ${key}, exec, ${cmd}";
  run = key: cmd: "SUPER_CTRL, ${key}, exec, ${cmd}";
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
  widgets = let
    bind = exec: key: "SUPER, ${key}, exec, ${exec}";
    js = run: bind '' kaizen -r "${run}" '';

    # Toggler
    toggle = win: bind "kaizen -t ${win}";
    show = name: js "toggleWidget('${name}');";
  in {
    reset = bind "kaizen -q; kaizen";

    overview = toggle "overview";
    launcher = toggle "launcher";
    shortcuts = toggle "shortcuts";
    powermenu = toggle "powermenu";

    player = show "player";
    colors = show "colors";
    ai-tools = show "ai-tools";
    datemenu = show "datemenu";
    keyboard = show "keyboard";
    quicksettings = show "quicksettings";
  };
}
