{ pkgs, ... }: {

  imports = [
    # ./niri
    ./hyprland
  ];

  home = {
    packages = with pkgs; [
      wtype         # Input simulator

      swayimg
      wlr-randr
      wl-clipboard  # Clipboard Utility

      # For consideration
      # wluma
      wl-mirror
      wf-recorder
    ];

    sessionVariables = {
      GDK_BACKEND = "wayland";
      QT_QPA_PLATFORM = "wayland";
      CLUTTER_BACKEND = "wayland";
      SDL_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
    };
  };
}
