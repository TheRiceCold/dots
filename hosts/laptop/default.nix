{ user, pkgs, unstable, ... }:

{
  imports = [ ./hardware-configuration.nix ] ++ (
    # Laptop Configuration Files
    import ./config ++
    import ../../modules/virtualisation
  );

  networking = {
    hostName = "NixOS";
    useDHCP = false;
    enableIPv6 = false;
    networkmanager.enable = true;
  };

  hardware = {
    enableRedistributableFirmware = true;
    bluetooth = {
      enable = true;
      package = pkgs.bluez;
    };
  };

  programs = {
    adb.enable = true;
    light.enable = true;
  };
}
