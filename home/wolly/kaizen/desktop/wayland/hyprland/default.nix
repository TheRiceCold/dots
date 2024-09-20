{
  imports = [./binds.nix ./pypr.nix ./ecosystem ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = import ./settings.nix;
  };
}
