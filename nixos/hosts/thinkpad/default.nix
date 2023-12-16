{ name, ... }:

{
  imports = [ ./hardware-configuration.nix ../../sys ];

  networking.hostName = name;

  security = {
    sudo.enable = false;
    doas.enable = true;
    doas.extraConfig = " permit nopass :wheel ";
  };

  system.stateVersion = "23.11";
}
