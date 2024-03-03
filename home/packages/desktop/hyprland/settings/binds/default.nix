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
      "SUPER, RETURN, exec, ${term}"
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
      (ags "Space" "launcher")
      (ags "Slash" "cheatsheet")

      # Pypr scratchpads
      (toggle "t" "term")
      (toggle "n" "network")
      (toggle "e" "explorer")
      (toggle "Escape" "system")
    ];

    bindr = [ "ControlSuper, r, exec, ags -q; ags" ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    bindl = with mkBind.media; [ mute play prev next ];
    binde = with mkBind; [
      (brightness.up "5")
      (brightness.down "5")

      (volume.up "5")
      (volume.down "5")
    ];
  };
}
