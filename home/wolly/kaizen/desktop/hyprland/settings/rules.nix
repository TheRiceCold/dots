{
  layer = [ ];
  window = [ "fakefullscreen, firefox" ];
  window2 = [
    "float,class:.*" # All classes are floated
    "float,title:.*"
    "tile,title:^(Spotify)$"
    "pin, title:^(Picture-in-Picture)$"
  ];
}
