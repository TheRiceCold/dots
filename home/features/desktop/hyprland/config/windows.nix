{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 4;
      gaps_out = 8;
      border_size = 2;
      "col.active_border" = "rgba(a28b35ff) 45deg";
      "col.inactive_border" = "rgba(ffffffff)";
      layout = "dwindle";
    };

    windowrule = [ 
      "float, rofi" 
      "float, foot" 
      "float, pavucontrol"
      "float, title:^(Picture-in-Picture)" 
    ];

    # layerrule = [ "blur, waybar" ];
    blurls = [ 
      "waybar" 
      "lockscreen" 
      "g4music"
      "amberol"
    ];
  };
}
