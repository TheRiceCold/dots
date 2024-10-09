{ inputs, pkgs, ... }: {
  imports = [
    ./pypr.nix
    ./binds.nix
    ./plugins.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = import ./settings.nix;
    package = inputs.hyprland.packages.${pkgs.system}.default;
  };

  services.hypridle = import ./hypridle.nix;
}
