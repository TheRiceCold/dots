{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, movewindow"
    ];

    bind = let 
      swaylock = "${pkgs.swaylock}/bin/swaylock";
      terminal = "${pkgs.foot}/bin/foot";
      browser = "${pkgs.firefox-wayland}/bin/firefox";
      launcher = "${pkgs.rofi-wayland}/bin/rofi";
      workspaces = [
        
      ];
    in [
      "SUPERSHIFT, q, killactive"
      "SUPERSHIFT, e, exit"

      "SUPER, f, fullscreen, 1"
      "SUPERSHIFT, f, fullscreen, 0"
      "SUPERSHIFT, t, togglefloating"

      "SUPER, RETURN, exec, ${terminal}"
      "SUPER, SPACE, exec, ${launcher} -show drun"
      "SUPER, b, exec, ${browser}"

      "SUPER, j, movefocus, d"
      "SUPER, k, movefocus, u"
      "SUPER, h, movefocus, l"
      "SUPER, l, movefocus, r"

      "SUPER, left, resizeactive, -40 0"
      "SUPER, right, resizeactive, 40 0"

      "SUPER, up, resizeactive, 0 -40"
      "SUPER, down, resizeactive, 0 40"

      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, 0, workspace, 10"

      "SUPERSHIFT, 1, movetoworkspacesilent, 1"
      "SUPERSHIFT, 2, movetoworkspacesilent, 2"
      "SUPERSHIFT, 3, movetoworkspacesilent, 3"
      "SUPERSHIFT, 4, movetoworkspacesilent, 4"
      "SUPERSHIFT, 5, movetoworkspacesilent, 5"
      "SUPERSHIFT, 6, movetoworkspacesilent, 6"
      "SUPERSHIFT, 7, movetoworkspacesilent, 7"
      "SUPERSHIFT, 8, movetoworkspacesilent, 8"
      "SUPERSHIFT, 9, movetoworkspacesilent, 9"
      "SUPERSHIFT, 0, movetoworkspacesilent, 10"      

      # Brightness control
      ",XF86MonBrightnessUp, exec, light -A 10"
      ",XF86MonBrightnessDown, exec, light -U 10"
    ];
  };
}
