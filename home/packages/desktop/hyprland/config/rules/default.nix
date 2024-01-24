{
  wayland.windowManager.hyprland.settings = {
    windowrule = import ./window.nix;

    layerrule = [ 
      "blur, bar"
      "blur, foot"
      "blur, gtk-layer-shell"
    ];
  };
}
