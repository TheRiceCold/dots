{
  imports = [
    ./ags.nix
    ./apps.nix
    ./indicators
    ./workspace.nix
  ];

  wayland.windowManager.hyprland.settings = {
    bind = [ "SUPERSHIFT, q, exit" ];

    bindm = [
      "SUPER, mouse:272, movewindow" 
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
