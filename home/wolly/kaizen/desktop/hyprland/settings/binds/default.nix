{ pkgs, ... }:
let
  mkBind = import ./mkBind.nix;
  apps = import ../../apps.nix pkgs;
in
{
  imports = [ ./window.nix ];

  wayland.windowManager.hyprland.settings = {
    bind = with apps; with mkBind; with media; [
      "SUPER_SHIFT, q, exit"

      # prefix is SUPER
      (exec "Equal" "pypr zoom")
      (exec "Return" "[tile] ${term}")

      # prefix is SUPER
      "SUPER, r, exec, pkill ags; ags" # Reset Ags
      (ags.media "p")
      (ags.datemenu "d")
      (ags.overview "Tab")
      (ags.powermenu "F4")
      (ags.launcher "Space")
      (ags.shortcuts "Slash")
      (ags.dropmenu "Period")

      # prefix is SUPER_CTRL
      (run-app "v" audio-control)
      (run-app "c" "${color-picker} -a")
      (run-app "b" "[workspace 2] ${browser} --browser-window")

      # Pypr Scatchpads Toggle's prefix is SUPER_CTRL
      (toggle "t" "term")
      (toggle "e" "explorer")
      (toggle "Escape" "system")

      # media binds
      mute play prev next
    ];

    binde = with mkBind; [
      (brightness.up-value "5")
      (brightness.down-value "5")

      (volume.up-value "5")
      (volume.down-value "5")
    ];
  };
}
