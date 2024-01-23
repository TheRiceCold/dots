let
  mkBind = import ./mkBind.nix;
in 
{
  wayland.windowManager.hyprland.settings = {
    bindl = with mkBind.media;[ mute play prev next ];

    binde = with mkBind; [
      (brightness "Up" "10")  
      (brightness "Down" "10")  

      (volume "Raise" "5%+")
      (volume "Lower" "5%-")
    ];
  };
}
