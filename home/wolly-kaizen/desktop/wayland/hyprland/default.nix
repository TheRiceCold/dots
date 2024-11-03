{
  imports = [
    ./binds
    ./pypr.nix

    # ./plugins.nix
    /* INFO: Weird but when enabled, hyprland xwayland will not work.
    I also prefer hyprland xwayland because it doesn't mess up the
    scaling of the applications. Like krita which I use pretty often. */
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = import ./settings.nix;
  };

  services.hypridle = import ./hypridle.nix;

  home.sessionVariables = {
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_CURRENT_DESKTOP = "Hyprland";
  };
}
