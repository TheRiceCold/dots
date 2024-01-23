{
  wayland.windowManager.hyprland.settings = {
    bindr = [ "Control+SUPER, r, exec, pkill ags; ags" ];

    bind = [
      "SUPER, Tab, exec, ags -t overview"
      "SUPER, Space, exec, ags -t launcher"
      "SUPER, a, exec, ags -t quicksettings"
      "SUPER, Slash, exec, ags -t cheatsheet"
      "Super, M, exec, ags run-js 'openMusicControls.value = (!Mpris.getPlayer() ? false : !openMusicControls.value);'"
    ];
  };
}
