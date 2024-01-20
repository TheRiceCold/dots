{ pkgs, ... }:

{ 
  boot = {

    loader = {
      timeout = 0;
      systemd-boot.enable = true; # Set to false if GRUB is enabled
      # systemd-boot.consoleMode = "auto";

      # grub = {
      #   enable = true;
      #   efiSupport = true;
      #   device = "nodev";
      #   splashImage = ../../assets/yukopi_wallpaper.png; 
      # };

      # efi.efiSysMountPoint = "/boot";
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };
}
