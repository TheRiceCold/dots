{
  layer = [ ];

  window = [ "fakefullscreen, firefox" ];

  window2 = [
    "float, class:.*"
    "pin, title:^(Picture-in-Picture)$"

    "tile,class:^(firefox)$"
    "maximize,class:^(krita)$"
    "maximize,class:^(blender)$"
    "maximize,class:^(vesktop)$"
    "maximize,class:^(Spotify)$"

    # "workspace 1, class:^(foot)$"
    "workspace 2,class:^(firefox)$"
    "workspace 3,class:^(Spotify)$"
    "workspace 4,class:^(vesktop)$"

    "opacity 0.9,class:^(firefox)$"
    "opacity 0.9,class:^(Spotify)$"

    "noblur, class:^(Gromit-mpx)$"
  ];
}
