{ pkgs, ... }:

{ 
  boot = {
    loader = {
      timeout = 0;
      systemd-boot.enable = true; # Set to false if GRUB is enabled
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };
}
