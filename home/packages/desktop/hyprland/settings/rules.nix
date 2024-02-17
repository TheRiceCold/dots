{
  window = let
    float = [
      "mpv"
      "rofi"
      "kitty"
      "blueman"
      "g4music"
      "swayimg"
      "pavucontrol"

      "showmethekey"
      "com.github.Aylur.ags"

      "title: floating"
      "title:^(Save As)$"
      "title:^(Library)$"
      "title:^(Open File)$"
      "title:^(Open Folder)$"
      "title:^(Select a File)$"
      "title:^(Picture-in-Picture)$"
    ];
  in [
    # "tile, firefox"
    # "noblur, .*" # Disables blur for windows. Substantially improves performance.
    # "fullscreen, firefox"
    "fakefullscreen, firefox"
    "opacity, 1.0, floating"
    "pin, title:^(Picture-in-Picture)$"
  ] ++ (map (i: "float, ${i}") float);

  layer = let
    ags = [
      "osk"
      "launcher"
      "overview"
      "dashboard"
      "powermenu"
      "indicator"
      "cheatsheet"
      "quicksettings"
      "notifications"
    ];
  in [
    "blur, bar"
    "ignorezero, bar"
    "blur, showmethekey"

    "blur, gtk-layer-shell"
    "ignorezero, gtk-layer-shell"
  ] ++ (map (i: "blur, ${i}") ags) ++ (map (i: "ignorealpha 0.6, ${i}") ags);
}
