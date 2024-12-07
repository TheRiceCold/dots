{
  imports = [
    ./binds
    # ./plugins.nix
    /* INFO: Weird but when enabled, hyprland xwayland will not work.
    I also prefer hyprland xwayland because it doesn't mess up the
    scaling of the applications. Like krita which I use pretty often. */
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    # INFO: Settings are mostly handled by kaizen(astal) using batching
    settings = let
      rules = import ./rules.nix;
    in {
      exec = ["kaizen"];
      monitor = [",preferred,auto,1"];
      misc.disable_hyprland_logo = true;
      layerrule = rules.layer;
      windowrule = rules.window;
      windowrulev2 = rules.window2;
      # source = ["~/.config/kaizen/binds.conf"];
    };
  };

  services.hypridle = import ./hypridle.nix;

  home.sessionVariables = {
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_CURRENT_DESKTOP = "Hyprland";
  };
}
