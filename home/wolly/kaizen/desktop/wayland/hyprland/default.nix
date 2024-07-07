{
  imports = [./binds.nix ./pypr.nix ./ecosystem ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = import ./settings.nix;
  };
}
