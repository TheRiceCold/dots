{ pkgs, ... }:
let
  mkBind = import ./mkBind.nix;
in
{
  imports = [ ./workspace.nix ];

  wayland.windowManager.hyprland.settings = {
    bind = let
      apps = import ../../apps.nix { inherit pkgs; };
      exec = key: cmd: "SUPERCRTL, ${key}, exec, ${cmd}";
      ags = key: win: "SUPER, ${key}, exec, ags -t ${win}";
      toggle = key: name: "SUPERCTRL, ${key}, exec, ${apps.pypr} toggle ${name}";
    in with apps; [
      "SUPERSHIFT, q, exit"
      "SUPER, RETURN, exec, ${foot}"
      "SUPER, Equal, exec, ${pypr} zoom"

      # Apps
      (exec "b" browser)
      (exec "v" audio-control)
      (exec "c" "${color-picker} -a")

      # Ags widgets
      (ags "m" "media")
      (ags "d" "datemenu")
      (ags "Period" "menu")
      (ags "Tab" "overview")
      (ags "F4" "powermenu")
      (ags "Space" "launcher")
      (ags "Slash" "cheatsheet")

      # Pypr scratchpads
      (toggle "t" "term")
      (toggle "e" "explorer")
      (toggle "Escape" "system")
    ];

    bindr = [ "SUPER, r, exec, ags -q; ags" ];

    binde = with mkBind; [
      (brightness.up "5")
      (brightness.down "5")

      (volume.up "5")
      (volume.down "5")
    ];

    bindl = with mkBind.media; [ mute play prev next ];
  };
}
