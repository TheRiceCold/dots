{
  layer = [ ];

  window = [
    "noblur, Gromit-mpx"
    "fakefullscreen, firefox"
    "float, title:^(Firefox — Sharing Indicator)$"
  ];

  window2 = [
    "float, class:.*"
    "tile,class:^(firefox)$"

    "maximize,class:^(blender)$"
    "maximize,class:^(vesktop)$"
    "maximize,class:^(Spotify)$"

    "float, class:^(firefox)$, title:^(Picture-in-Picture)$"

    # "workspace 1, class:^(foot)$"
    "workspace 2,class:^(firefox)$"
    "workspace 3,class:^(Spotify)$"
    "workspace 4,class:^(vesktop)$"
    "workspace 5,class:^(Virt-manager)$"

    "opacity 0.9,class:^(firefox)$"
    "opacity 0.85,class:^(Spotify)$"
    "opacity 0.85,class:^(pavucontrol)$"
  ];
}
