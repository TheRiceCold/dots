{ disk, stateVersion, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  disko = disk;
  networking.hostName = "minimo";

  services = {
    xserver = {
      displayManager.startx.enable = true;
      windowManager.dwm = {
        enable = true;
      };
    };
  };

  system.stateVersion = stateVersion;
}
