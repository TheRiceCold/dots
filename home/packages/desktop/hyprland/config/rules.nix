{
  layer = [ 
    "blur, foot"
    "blur, gtk-layer-shell"
  ];

  window = [ 
    "float, title:floating"

    "float, mpv"
    "float, kitty"
    "float, swayimg"
    "float, pavucontrol"

    "float, title:^(Save As)$"
    "float, title:^(Library)$"
    "float, title:^(Open File)$"
    "float, title:^(Open Folder)$"
    "float, title:^(Select a File)$"
    "float, title:^(Picture-in-Picture)$"

    "opacity, 1.0, floating"
    "pin, Picture-in-Picture"

    "tile, firefox"
  ];
}
