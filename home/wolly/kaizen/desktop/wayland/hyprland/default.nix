{
  imports = [
    ./pypr
    ./ecosystem
    ./binds.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = import ./settings.nix;
  };
}
