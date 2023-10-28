{ user, pkgs, unstable, ... }:

{
  imports = [ 
   ./hardware-configuration.nix 

    # Laptop Configuration Files
   ./config/boot.nix
   ./config/users.nix
   ./config/fonts.nix
   ./config/systemd.nix
   ./config/services.nix
   ./config/security.nix
   ./config/environment.nix

  ] ++ (
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
