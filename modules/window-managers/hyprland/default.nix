{ config, user, inputs, pkgs, lib, ... }:

with lib; 
{
  config = mkIf (config.hyprland.enable) {
    wlwm.enable = true; # Enables programs for Wayland

    environment = {
      loginShellInit = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec Hyprland
        fi
      '';

      variables = {
        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
      };

      sessionVariables = {
        EDITOR = "nvim";
        WLR_BACKEND = "vulkan";
        WLR_RENDERER = "vulkan";
        WLR_NO_HARDWARE_CURSORS = "1";

        GDK_BACKEND = "wayland";
        MOZ_ENABLE_WAYLAND = "1";
        _JAVA_AWT_WM_NONPARENTING = "1";

        QT_SCALE_FACTOR = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_QPA_PLATFORMTHEME = "gtk3";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

        NIXOS_OZONE_WL = "1";
        __GL_VRR_ALLOWED = "0";
        __GL_GSYNC_ALLOWED = "0";
        SDL_VIDEODRIVER = "wayland";

        DISABLE_QT5_COMPAT = "0";
        CLUTTER_BACKEND = "wayland";
        SSH_AUTO_SOCK = "/run/user/1000/keyring/ssh";
      };

      systemPackages = with pkgs; [
        swww            # Wallpaper daemon
        swappy          # Snapshot Editor
        swaylock        # Lock Screen
        wlr-randr       # Monitor Settings
        hyprpicker      # Color Picker

        grim            # Grab Images
        slurp           # Region Selector

        # wl-clipboard    # Clipboard

        # mako
        # pamixer
        # wlogout
        # wlsunset        # Day/night gamma adjustments for Wayland
      ];
    };

    security.pam.services.swaylock = {
      text = ''
        auth include login
      '';
    };

    systemd.sleep.extraConfig = ''
      AllowSuspend=yes
      AllowHibernation=no
      AllowSuspendThenHibernate=no
      AllowHybridSleep=yes
    '';                                       # Clamshell Mode

    programs = {
      hyprland = {                            # Window Manager
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      };
    };
    
    home-manager.users.${user} = {
      xdg.configFile."hypr/hyprland.conf".text = import ./config.nix;
    };
  };
}

