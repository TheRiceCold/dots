{ user, pkgs, unstable, ... }:

{
  imports = [./hardware-configuration.nix]++(import ./common);

  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
      };
      efi = {
        canTouchEfiVariables  = true;
        efiSysMountPoint = "/boot/EFI";
      };
      timeout = 1;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

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

  security = {
    rtkit.enable  = true;
    polkit.enable = true;

    sudo.enable = false;
    doas = {
      enable = true;
      extraConfig = "
        permit nopass :wheel
      ";
    };
  };
  
  fonts = {
    fontconfig.enable = true;
    fontDir.enable    = true;
    fonts = with pkgs; [
      jetbrains-mono
      font-awesome     
      (nerdfonts.override {
        fonts = [ 
          "FiraCode"
          "JetBrainsMono" 
        ];
      })
    ];
  };
}
