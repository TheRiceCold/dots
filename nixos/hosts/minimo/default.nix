{ pkgs, name, stateVersion, ... }:

{
  imports = [ ./hardware-configuration.nix ];

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
