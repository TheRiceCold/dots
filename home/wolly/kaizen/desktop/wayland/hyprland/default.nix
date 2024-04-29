{
  imports = [ ./binds ./pypr ./ecosystem ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = import ./settings.nix;
  };
}
