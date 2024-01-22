{
  imports = [
    ./ags.nix
    ./apps.nix
    ./mouse.nix
    ./workspace.nix
  ];

  wayland.windowManager.hyprland.settings = {
    bindl = let
      audio = key: exec: ",XF86Audio${key}, exec, ${exec}";
    in [ 
      (audio "Mute" "pactl set-sink-mute @DEFAULT_SINK@ toggle")
      (audio "Play" "playerctl play-pause")
      (audio "Prev" "playerctl previous")
      (audio "Next" "playerctl next")
    ];

    bind = [ "SUPERSHIFT, q, exit" ];
  };
}
