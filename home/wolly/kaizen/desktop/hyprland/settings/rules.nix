{
  layer = [ ];
  window = [ "fakefullscreen, firefox" ];
  # FIX: foot scratchpad terminal needs to be floated
  window2 = let
    float-title = [
      "Save As"
      "Library"
      "Open File"
      "Open Folder"
      "Select a File"
      "Picture-in-Picture"
      "scratchpad-term"
    ];
  in [
    "float,class:.*"
    "tile,title:^(foot)$"
    "tile,class:^(firefox)$"
    "tile,title:^(Spotify)$"

    "pin, title:^(Picture-in-Picture)$"
  ] ++ (map (i: "float,title:^(${i})$") float-title);
}
