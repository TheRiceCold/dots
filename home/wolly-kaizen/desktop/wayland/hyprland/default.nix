{
  imports = [
    ./binds
    ./pypr.nix
    # ./plugins.nix # INFO: when enabled, xwayland apps don't run. Weird
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = import ./settings.nix;
  };

  # services.hypridle = import ./hypridle.nix;
}
