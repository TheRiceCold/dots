let
  indicator = "ags -r 'indicator.popup(1);'";
  mute = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
  volume-change = val: "wpctl set-volume @DEFAULT_AUDIO_SINK@ ${val}";
  brightness-change = key: val: "light ${if key == "Up" then "-A" else "-U"} ${val}; ${indicator}";
in {
  media = let 
    bind = key: exec: ",XF86Audio${key}, exec, ${exec}"; 
  in {
    mute = bind "Mute" mute;
    # stop = bind "Stop" "";
    # mic-mute = bind "MicMute" "";
    next = bind "Next" "playerctl next";
    prev = bind "Prev" "playerctl previous";
    play = bind "Play" "playerctl play-pause";
  };

  volume = key: val: ",XF86Audio${key}Volume, exec, ${volume-change val}; ${indicator}";
  brightness = key: val: ",XF86MonBrightness${key}, exec, ${brightness-change key val}";

  window = let
    bind = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
  in {
    pin = key: "${key}, pin";
    kill = key: "${key}, killactive";
    float = key: "${key}, togglefloating";
    maximized = key: "${key}, fullscreen, 1";
    fullscreen = key: "${key}, fullscreen, 0";

    focus = bind "SUPER" "movefocus";
    move = bind "SUPER ALT" "moveactive";
    swap = bind "SUPERSHIFT" "swapwindow";
    resize = bind "SUPER CTRL" "resizeactive";
  };
}
