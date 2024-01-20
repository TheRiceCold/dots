{
  wayland.windowManager.hyprland.settings = {
    windowrule = let
      f = win: "float, ^(${win})$"; # Float
      ft = win: "float, title:^(${win})$"; # Float Title

      p = win: "pin, title:^(${win})$";
      w = num: win: "workspace ${num}, class:^(${win})$";
      # o = val: win: "opacity ${val}, ^(${win})$"; # Opacity
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

      (p "Picture-in-Picture")
      (ft "Picture-in-Picture")

      (w "2" "firefox")

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
