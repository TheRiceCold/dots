{
  imports = [
    ./apps.nix
    ./widgets.nix
    ./workspace.nix
    ./indicators.nix
  ];

  wayland.windowManager.hyprland.settings = {
    bind = [ "SUPERSHIFT, q, exit" ];

    bindm = [
      "SUPER, mouse:272, movewindow" 
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
