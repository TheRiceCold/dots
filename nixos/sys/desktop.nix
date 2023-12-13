{ pkgs, ... }:

{
  programs.dconf.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  programs.light.enable = true; 

  environment.systemPackages = [ pkgs.linux-firmware ];

  fonts.fonts = with pkgs; [ 
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
}
