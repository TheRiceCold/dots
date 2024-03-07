{ pkgs, ... }:
let
  mkBind = import ./mkBind.nix;
  apps = import ../../apps.nix pkgs;
in
{
  imports = [ ./workspace.nix ];

  wayland.windowManager.hyprland.settings = {
    bind = with apps; with mkBind; [
      # INFO: exec's prefix is SUPER
      (exec "Equal" "pypr zoom")
      (exec "Return" "[tile] ${term}")

      # INFO: ags' prefix is SUPER
      (ags "m" "media")
      (ags "d" "datemenu")
      (ags "Period" "menu")
      (ags "Tab" "overview")
      (ags "F4" "powermenu")
      (ags "Space" "launcher")
      (ags "Slash" "cheatsheet")

      # INFO: run-app's prefix is SUPER_CTRL
      (run-app "v" audio-control)
      (run-app "c" "${color-picker} -a")
      (run-app "b" "[workspace 2;maximize] ${browser} --browser-window")

      # INFO: Pypr Scatchpads Toggle's prefix is SUPER_CTRL
      (toggle "t" "term")
      (toggle "e" "explorer")
      (toggle "Escape" "system")

      "SUPER_SHIFT, q, exit"
    ];

    bindr = with apps; [
      "SUPER, r, exec, ags -q; ags" # Reset Ags
    ];

    binde = with mkBind; [
      (brightness.up-value "5")
      (brightness.down-value "5")

      (volume.up-value "5")
      (volume.down-value "5")
    ];

    bindl = with mkBind.media; [ mute play prev next ];
  };
}
