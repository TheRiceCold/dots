{ user, pkgs, unstable, ... }:

{
  imports = [ ./hardware-configuration.nix ] ++ (
    # Laptop Configuration Files
    import ./config ++
    import ../../modules/virtualisation
  );

  networking = {
    hostName = "NixOS";
    networkmanager.enable = true;
    useDHCP = false;
  };

  hardware = {
    enableRedistributableFirmware = true;
    bluetooth = {
      enable = true;
      package = pkgs.bluez;
    };
  };

  programs.light.enable = true;
}
