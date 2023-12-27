{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 4;
      gaps_out = 4;
      border_size = 2;
      cursor_inactive_timeout = 4;
      "col.active_border" = "rgba(a28b35ff) 45deg";
      "col.inactive_border" = "0xff382d2e";
    };

    windowrule = let
      f = regex: "float, ^(${regex})$";
    in [ 
      "tile, firefox"

      (f "rofi")
      (f "btop")
      (f "swayimg")
      (f "joshuto")
      (f "g4music")
      (f "pavucontrol")
      "float, title:^(Picture-in-Picture)" 
    ];

    layerrule = [ "blur, waybar" ];
    # blurls = [ "waybar" "lockscreen" ];
  };
}
