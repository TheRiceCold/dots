let
  indicator = "ags -r 'indicator.popup(1);'";
  volume-change = val: "wpctl set-volume @DEFAULT_AUDIO_SINK@ ${val}";
  brightness-change = key: val: "light ${if key == "Up" then "-A" else "-U"} ${val}; ${indicator}";
in {
  media = let 
    b = key: exec: ",XF86Audio${key}, exec, ${exec}"; 
  in {
    mute = b "Mute" "pactl set-sink-mute @DEFAULT_SINK@ toggle";
    play = b "Play" "playerctl play-pause";
    prev = b "Prev" "playerctl previous";
    next = b "Play" "playerctl next";
  };

  brightness = key: val: ",XF86MonBrightness${key}, exec, ${brightness-change key val}";
  volume = key: val: ",XF86Audio${key}Volume, exec, ${volume-change val}; ${indicator}";
}
