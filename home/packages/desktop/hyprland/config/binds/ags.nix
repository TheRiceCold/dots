{
  wayland.windowManager.hyprland.settings = {
    bindr = [ "Control+SUPER, r, exec, pkill ags; ags" ];

    binde = let
      indicator = "ags -r 'indicator.popup(1);'";
      volume = key: exec: ",XF86Audio${key}Volume, exec, ${exec}; ${indicator}";
      brightness = key: exec: ",XF86MonBrightness${key}, exec, ${exec}; ${indicator}";
    in [
      (brightness "Up" "light -A 10")  
      (brightness "Down" "light -U 10")

      (volume "Raise" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")
      (volume "Lower" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
    ];

    bind = [
      "SUPER, Tab, exec, ags -t overview"
      "SUPER, Space, exec, ags -t launcher"
      "SUPER, a, exec, ags -t quicksettings"
      "SUPER, Slash, exec, ags -t cheatsheet"
      "Super, M, exec, ags run-js 'openMusicControls.value = (!Mpris.getPlayer() ? false : !openMusicControls.value);'"
    ];
  };
}
