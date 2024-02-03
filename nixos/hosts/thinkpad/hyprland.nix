{ inputs, pkgs, ... }:

let
  ags = inputs.ags.packages.${pkgs.system}.ags;
  conf = pkgs.writeText "config" ''
    exec-once = swww init
    exec-once = swww img ${../../../assets/nixos-wallpaper.png}
    exec-once = ags -c ${./greeter.js}; hyprctl dispatch exit
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

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  security = {
    polkit.enable = true;
    pam.services.ags = { };
  };

  environment.systemPackages = [ 
    ags
    pkgs.swww
    pkgs.loupe
  ];

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
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
