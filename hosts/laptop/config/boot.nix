{ pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot = {
        enable      = true;
        consoleMode = "auto";
      };
      # grub = {                  # Grub Dual Boot
      #   enable = true;
      #   devices = [ "nodev" ];
      #   efiSupport = true;
      #   useOSProber = true;     # Find All Boot Options
      #   configurationLimit = 2;
      # };

      efi = {
        canTouchEfiVariables  = true;
        efiSysMountPoint = "/boot";
      };

      timeout = 1;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
