{ pkgs, ... }:

{
  programs = {
    adb.enable = true;
    dconf.enable = true;
    light.enable = true; 
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
    opentabletdriver.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  security.polkit.enable = true;
  # environment.systemPackages = [ pkgs.linux-firmware ];

  environment.loginShellInit = ''
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec Hyprland
    fi
  '';

  fonts.packages = with pkgs; [ 
    jetbrains-mono 
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
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

  services = {
    blueman.enable = true;
    gvfs.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    accounts-daemon.enable = true;
    gnome = {
      evolution-data-server.enable = true;
      glib-networking.enable = true;
      gnome-keyring.enable = true;
      gnome-online-accounts.enable = true;
    };
  };
}
