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
      f = win: "float, ^(${win})$"; # Float
      ft = win: "float, title:^(${win})(.*)$"; # Float Title
      o = val: win: "opacity ${val}, ^(${win})$"; # Opacity
    in [ 
      "tile, firefox"

      (f "rofi")
      (f "btop")
      (f "swayimg")
      (f "joshuto")
      (f "g4music")
      (f "pavucontrol")

      (ft "Save As")
      (ft "Library")
      (ft "Open File")
      (ft "Open Folder")
      (ft "Select a File")
      (ft "Choose wallpaper")
      (ft "Picture-in-Picture")

      (o "0.95" "foot")
    ];

    # windowrulev2 = [ "pin, title:^(Picture-in-Picture)$" ];

    layerrule = let
      b = win: "blur, ${win}";
    in [ 
      (b "foot")
      (b "waybar")
      (b "session")
      (b "launcher")
      (b "sideleft")
      (b "sideright")
      (b "indicator")
      (b "cheatsheet")
      (b "notifications")
      (b "gtk-layer-shell")

      "noanim, sideleft"
      "noanim, sideright"
    ];
  };
}
