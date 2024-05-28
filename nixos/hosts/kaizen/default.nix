{ config, disk, ... }: {

  imports = [ 
    ./desktop.nix 
    ./services.nix 
    ./hardware-configuration.nix 
  ];

  # disko = import disk;
  networking.hostName = "kaizen";

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings.General.Experimental = true;
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };

  boot = {
    blacklistedKernelModules = [ "k10temp" ];
    extraModulePackages = [ config.boot.kernelPackages.zenpower ];
  };

  # Allow systemd to handle coredumps.
  systemd.coredump.enable = true;
}
