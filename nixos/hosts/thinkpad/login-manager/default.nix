{ inputs, pkgs, ... }:

let
  wallpaper = pkgs.writeText "wallpaper" ''
    preload=${../../../assets/nixos-wallpaper.png}
    wallpaper=, ${../../../assets/nixos-wallpaper.png}
  ''; # Fix: wallpaper not working
  conf = pkgs.writeText "config" ''
    exec-once=hyprpaper -c ${wallpaper}
    exec-once=ags -c ${./greeter.js}; hyprctl dispatch exit
    misc {
      force_default_wallpaper = 0
      disable_hyprland_logo = true
      disable_splash_rendering = true
    }
    input {
      kb_layout = us
    }
  '';
in {
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      displayManager.startx.enable = true;
    };

    greetd = {
      enable = true;
      settings.default_session.command = "Hyprland --config ${conf}";
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  security = {
    polkit.enable = true;
    pam.services.ags = { };
  };

  environment.systemPackages = [ inputs.ags.packages.${pkgs.system}.ags ];

  systemd.user.services = {
    polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  }; 
}
