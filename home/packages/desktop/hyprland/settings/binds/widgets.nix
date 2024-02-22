{
  wayland.windowManager.hyprland.settings = {
    bindr = [ "ControlSuper, r, exec, ags -q; ags" ];

    bind = let
      ags = key: win: "SUPER, ${key}, exec, ags -t ${win}";
    in [
      (ags "Tab" "overview")
      (ags "a" "quicksettings")
      (ags "Slash" "cheatsheet")
      (ags "Space" "applauncher")
    ];
  };
}
