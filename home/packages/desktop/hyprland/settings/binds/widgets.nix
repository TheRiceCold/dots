{
  wayland.windowManager.hyprland.settings = {
    bindr = [ "ControlSuper, r, exec, ags -q; ags" ];

    bind = let
      ags = key: win: "SUPER, ${key}, exec, ags -t ${win}";
    in [
      (ags "m" "menu")
      (ags "Tab" "overview")
      (ags "Space" "launcher")
      (ags "Slash" "cheatsheet")
    ];
  };
}
