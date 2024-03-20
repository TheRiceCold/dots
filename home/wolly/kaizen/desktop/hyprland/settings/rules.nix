{
  layer = [ ];

  window = [
    "noblur, Gromit-mpx"
    "fakefullscreen, firefox"
    "float, title:^(Firefox — Sharing Indicator)$"
  ];

  window2 = [
    "float, class:.*"

    "maximize,class:^(krita)$"
    "maximize,class:^(blender)$"
    "maximize,class:^(vesktop)$"
    "maximize,class:^(Spotify)$"

    "maxsize 1000 1000, class:(firefox)"
    "float, class:^(firefox)$, title:^(Picture-in-Picture)$"

    # "workspace 1, class:^(foot)$"
    "workspace 2,class:^(firefox)$"
    "workspace 3,class:^(Spotify)$"
    "workspace 4,class:^(vesktop)$"

    "opacity 0.9,class:^(firefox)$"
    "opacity 0.9,class:^(Spotify)$"
  ];
}
