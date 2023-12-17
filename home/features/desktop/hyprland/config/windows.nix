{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 10;
      gaps_out = 14;
      border_size = 3;
      "col.active_border" = "rgba(a28b35ff) 45deg";
      "col.inactive_border" = "rgba(ffffffff)";
      layout = "dwindle";
    };

    windowrule = [ 
      "float, rofi" 
      "float, foot" 
      "float, title:^(Picture-in-Picture)" 
    ];

    # layerrule = [ "blur, waybar" ];
    blurls = [ "waybar" "lockscreen" ];
  };
}
