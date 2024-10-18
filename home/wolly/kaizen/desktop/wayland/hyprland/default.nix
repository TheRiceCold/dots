{
  imports = [./binds ./pypr.nix ./plugins.nix];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
    settings = import ./settings.nix;
  };

  services.hypridle = import ./hypridle.nix;
}
