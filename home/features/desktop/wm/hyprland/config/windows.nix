{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 4;
      gaps_out = 4;
      border_size = 2;
      cursor_inactive_timeout = 4;
      "col.active_border" = "rgba(5529a5FF)";
      "col.inactive_border" = "rgba(4b4358AA)";
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

      "opacity 0.8 0.8,class:^(foot)$"
    ];

    # layerrule = [ "blur, waybar" ];
    blurls = [ 
      "ags"
      "waybar" 
      "lockscreen" 
    ];
  };
}
