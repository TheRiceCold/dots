{
  wayland.windowManager.hyprland.settings = {
    bindr = [ 
      "ControlSuper, r, exec, pkill ags; ags;" 
    ];

    bind = let
      ags = key: win: "SUPER, ${key}, exec, ags -t ${win}";
    in [
      (ags "Tab" "overview")
      (ags "Delete" "powermenu")
      (ags "Space" "launcher")
      (ags "a" "quicksettings")
      (ags "Slash" "cheatsheet")
    ];
  };
}
