{
  layer = [ ];

  # FIX: floats and pin
  window = let
    float-title = [
      "Save As"
      "Library"
      "Open File"
      "Open Folder"
      "Select a File"
      "Picture-in-Picture"
    ];
  in [
    "fakefullscreen, firefox"
    "pin, title:^(Picture-in-Picture)$"
  ] ++ (map (i: "float,title:^(${i})$") float-title);

  window2 = [
    "float,class:.*"
    "tile,class:^(firefox)$"
    "tile,title:^(Spotify)$"
  ];
}
