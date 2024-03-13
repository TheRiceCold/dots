{ disk, stateVersion, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  disko = disk;
  networking.hostName = "minimo";

  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      displayManager.startx.enable = true;
      windowManager.dwm = {
        enable = true;
      };
      libinput = {
        enable = true;
        touchpad = {
          tapping = true;
          middleEmulation = true;
          naturalScrolling = true;
        };
      };
    };
  };

  system.stateVersion = stateVersion;
}
