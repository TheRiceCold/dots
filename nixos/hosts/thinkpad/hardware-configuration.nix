{ config, lib, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

<<<<<<<< HEAD:hosts/thinkpad/hardware-configuration.nix
  boot.initrd.availableKernelModules = [ "nvme" "ehci_pci" "xhci_pci" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
========
  boot.initrd.availableKernelModules = [ "nvme" "ehci_pci" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc" ];
>>>>>>>> unstable:nixos/hosts/thinkpad/hardware-configuration.nix
  boot.kernelModules = [ "kvm-amd" ];

<<<<<<<< HEAD:hosts/thinkpad/hardware-configuration.nix
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e4ea17a8-eac1-4861-8250-53dd91745b39";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/7FB9-1BF1";
      fsType = "vfat";
    };
========
  fileSystems."/" = { 
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };
>>>>>>>> unstable:nixos/hosts/thinkpad/hardware-configuration.nix

  swapDevices = [{
    device = "/swapfile";
    size = 8192;
  }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp166s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
