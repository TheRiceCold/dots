{ config, user, inputs, pkgs, lib, ... }:

with lib; 
{
  imports = [ ./waybar.nix ./rofi ];
  config = mkIf (config.hyprland.enable) {
    environment = {
      loginShellInit = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec Hyprland
        fi
      '';

      sessionVariables = {
        EDITOR = "lvim";
        WLR_BACKEND = "vulkan";
        WLR_RENDERER = "vulkan";
        WLR_NO_HARDWARE_CURSORS = "1";
        _JAVA_AWT_WM_NONPARENTING = "1";
        SDL_VIDEODRIVER = "wayland";
        QT_SCALE_FACTOR = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
      };

      systemPackages = with pkgs; [
        wlr-randr         # Monitor Settings
        hyprpicker        # Color Picker
        swww              # Wallpaper daemon

        grim              # Grab Images
        slurp             # Region Selector
        swappy            # Snapshot Editor
        wf-recorder       # Screen Record

        wl-clipboard      # Clipboard
        cliphist          # Clipboard Manager

        swaylock          # Lock Screen
        swaylock-effects  # Lock Screen

        mako
        waybar
        swayimg
        eww-wayland
        rofi-wayland
        # pamixer
        # wlogout
        # wlsunset        # Day/night gamma adjustments for Wayland
      ];
    };

    security.pam.services.swaylock.text = '' auth include login '';

    systemd = {
      # user.targets.hyprland-session.Unit.Wants = [
      #   "xdg-desktop-autostart.target" 
      # ];
      sleep.extraConfig = ''
        AllowSuspend=yes
        AllowHibernation=no
        AllowSuspendThenHibernate=no
        AllowHybridSleep=yes
      '';      
    };

    programs = {
      hyprland.enable = true;
      hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
    
    home-manager.users.${user} = {
      xdg.configFile."hypr/hyprland.conf".text = import ./config.nix;
    };
  };
}

