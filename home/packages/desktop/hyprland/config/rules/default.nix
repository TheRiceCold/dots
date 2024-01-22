{
  wayland.windowManager.hyprland.settings = {
    windowrule = let
      f = win: "float, ^(${win})$"; # Float
      ft = win: "float, title:^(${win})$"; # Float Title

      p = win: "pin, title:^(${win})$";
      o = val: win: "opacity ${val}, title:^(${win})$"; # Opacity
    in [ 
      "tile, firefox"

      (f "mpv")
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

      (o "1.0 1.0" "Picture-in-Picture")
      (p "Picture-in-Picture")
      (ft "Picture-in-Picture")

      "float, title:floating"
    ];

    # windowrulev2 = [ "pin, title:^(Picture-in-Picture)$" ];

    layerrule = let
      b = win: "blur, ${win}";
    in [ 
      (b "foot")
      (b "waybar")
      (b "gtk-layer-shell")

      # AGS
      (b "sidebar")
      (b "launcher")
      (b "powermenu")
      (b "cheatsheet")

      "noanim, sideleft"
      "noanim, sideright"
    ];
  };
}
