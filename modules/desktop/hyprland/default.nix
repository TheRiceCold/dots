{ ... }:

{
  imports = [ (import ./environments.nix) ];

  programs = {
    bash = { 
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec Hyprland
        fi
      '';
    };
  };

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
    nvidiaPatches = false;
    systemdIntegration = true;
    extraConfig = ''
      input {
        kb_layout = us
        follow_mouse = 1

        touchpad = {
          natural_scroll = yes
        }
      }

      general {
        mainMod = SUPER
        gaps_in = 5
        gaps_out = 10
        border_size = 4
        sensitivity = 2.0
        col.active_border=0xFFB4A1DB
        col.inactive_border=0xFF343A40
      }

      decoration {
        rounding = 2

        active_opacity = 1.0
        inactive_opacity = 1.0
        fullscreen_opacity = 1.0

        blur = 0
        blur_size= 3
        blur_new_optimizations = true
      }
    '';
  };
}
