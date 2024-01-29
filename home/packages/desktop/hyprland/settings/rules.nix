{
  window = [ 
    # "tile, firefox"
    # "noblur, .*" # Disables blur for windows. Substantially improves performance.

    "float, title:floating"

    "float, mpv"
    "float, rofi"
    "float, swayimg"
    "float, g4music"
    "float, pavucontrol"

    "float, title:^(Save As)$"
    "float, title:^(Library)$"
    "float, title:^(Open File)$"
    "float, title:^(Open Folder)$"
    "float, title:^(Select a File)$"
    "float, title:^(Picture-in-Picture)$"

    "opacity, 1.0, floating"
    "pin, title:^(Picture-in-Picture)$"

    "fakefullscreen, firefox"
  ];

  layer = [ 
    "blur, bar"
    "ignorezero, bar"

    "blur, foot"

    "blur, gtk-layer-shell"
    "ignorezero, gtk-layer-shell"

    "blur, launcher"
    # "ignorealpha 0.5, launcher"

    "blur, cheatsheet"
    # "ignorealpha 0.6, cheatsheet"

    "blur, powermenu"

    "blur, indicator"
    # "ignorealpha 0.5, indicator"

    "blur, notifications"
    # "ignorealpha 0.69, notifications"

    "blur, dashboard"
    "blur, quicksettings"

    "noanim, dashboard"
    "noanim, quicksettings"
  ];
}
