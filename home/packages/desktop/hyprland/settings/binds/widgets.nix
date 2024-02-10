{
  wayland.windowManager.hyprland.settings = {
    bindr = [ 
      "ControlSuper, r, exec, ags -q; ags" 
    ];

    bind = let
      ags = key: win: "SUPER, ${key}, exec, ags -t ${win}";
    in [
      (ags "Tab" "overview")
      (ags "Space" "launcher")
      (ags "a" "quicksettings")
      (ags "Slash" "cheatsheet")
    ];
  };
}
