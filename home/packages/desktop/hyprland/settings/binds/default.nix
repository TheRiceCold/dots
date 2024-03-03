{ pkgs, ... }:
let
  mkBind = import ./mkBind.nix;
in
{
  imports = [ ./ags.nix ./workspace.nix ];

  wayland.windowManager.hyprland.settings = {
    bind = let
      term = "${pkgs.foot}/bin/foot";
      browser = "${pkgs.firefox-wayland}/bin/firefox";
      color-picker = "${pkgs.hyprpicker}/bin/hyprpicker";
      toggle = key: name: "SUPER, ${key}, exec, pypr toggle ${name}";
    in [
      "SUPERSHIFT, q, exit"

      "SUPER, b, exec, ${browser}"
      "SUPER, RETURN, exec, ${term}"
      "SUPERCTRL, c, exec, ${color-picker} -a"

      # Pypr
      (toggle "v" "volume")
      (toggle "n" "network")
      (toggle "e" "explorer")
      "SUPERSHIFT, Z, exec, pypr zoom"
    ];

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
