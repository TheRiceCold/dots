{ inputs, pkgs, config, ... }: {
  imports = [ ./hardware-configuration.nix ];

  # disko = import disk;
  networking.hostName = "kaizen";

  environment.systemPackages = let
    kaivim = inputs.kaivim.packages.${pkgs.system}.default;
  in [ kaivim ];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings.General.Experimental = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu.package = pkgs.qemu;
  };

  services = {
    gvfs.enable = true;
    upower.enable = true;
    blueman.enable = true;
    power-profiles-daemon.enable = false;
  };

  boot = {
    blacklistedKernelModules = ["k10temp"];
    extraModulePackages = [config.boot.kernelPackages.zenpower];
  };

  # Allow systemd to handle coredumps.
  systemd.coredump.enable = true;
}
