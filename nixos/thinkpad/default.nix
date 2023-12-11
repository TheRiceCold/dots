{ pkgs, ... }:

{
  imports = [./hardware-configuration.nix]++(import ./common);

  # BOOT
  boot.loader = {
    timeout = 1;
    systemd-boot.enable = true;
    systemd-boot.consoleMode = "auto";

    efi.efiSysMountPoint = "/boot";
    efi.canTouchEfiVariables  = true;
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # NETWORKING
  networking = {
    useDHCP = false;
    hostName = "NixOS";
    enableIPv6 = false;
    networkmanager.enable = true;
  };

  # HARDWARE
  hardware = {
    bluetooth.enable = true;
    bluetooth.package = pkgs.bluez;
    enableRedistributableFirmware = true;
  };

  # SECURITY
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

  # PROGRAMS
  programs.adb.enable = true;
  programs.light.enable = true;
  
  # FONTS 
  fonts = {
    fontDir.enable = true;
    fontconfig.enable = true;
    fonts = with pkgs; [ 
      font-awesome 
      jetbrains-mono 
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
  };
}
