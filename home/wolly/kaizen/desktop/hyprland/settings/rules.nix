{
  layer = [ ];
  window = [ "fakefullscreen, firefox" ];
  window2 = let
    small-windows = [
      "Save As"
      "Library"
      "Open File"
      "Open Folder"
      "Select a File"
      "Picture-in-Picture"
    ];
  in [
    "float,class:.*"

    "tile,class:^(firefox)$"

    "maximize,class:^(krita)$"
    "maximize,class:^(blender)$"
    "maximize,class:^(vesktop)$"
    "maximize,class:^(Spotify)$"
    "opacity 0.9, class:^(Spotify)$"

    "pin,title:^(Picture-in-Picture)$"
  ];
}
