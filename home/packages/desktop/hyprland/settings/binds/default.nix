let
  mkBind = import ./mkBind.nix;
in
{
  imports = [ ./apps.nix ./widgets.nix ./workspace.nix ];

  wayland.windowManager.hyprland.settings = {
    bind = [ "SUPERSHIFT, q, exit" ];

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
