{ inputs, pkgs, ... }: {
  imports = [ ./binds ./pypr ./plugins.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
    settings = import ./settings.nix;
    package = inputs.hyprland.packages.${pkgs.system}.default;
  };

  services.hypridle = import ./hypridle.nix;
}
