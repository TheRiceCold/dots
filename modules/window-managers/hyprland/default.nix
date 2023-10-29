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
        WLR_BACKEND = "vulkan";
        WLR_RENDERER = "vulkan";
        WLR_NO_HARDWARE_CURSORS = "1";

        GDK_BACKEND = "wayland";
        MOZ_ENABLE_WAYLAND = "1";
        _JAVA_AWT_WM_NONPARENTING = "1";

        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      };

      systemPackages = with pkgs; [
        grim            # Grab Images
        swww            # Wallpaper daemon
        swappy          # Snapshot Editor
        swaylock        # Lock Screen
        wlr-randr       # Monitor Settings
        hyprpicker      # Color Picker
        wl-clipboard    # Clipboard

        # slurp           # Region Selector
        # mako
        # pamixer
        # wlogout
        # wayland
        # wlsunset        # Day/night gamma adjustments for Wayland
        # xwayland
        # polkit_gnome
        # wayland-utils
        # wayland-protocols
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
      xdg.configFile."hypr/hyprland/wallpapers".source = import ./wallpapers
    };
  };
}

