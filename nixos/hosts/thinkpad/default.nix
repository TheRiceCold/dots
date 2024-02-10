{ config, pkgs, name, stateVersion, ... }:

{
  imports = [ 
    ./login-manager
    ./services.nix 
    ./environment.nix 
    ./hardware-configuration.nix 
  ];

  networking.hostName = name;
  programs = {
    adb.enable = true;
    virt-manager.enable = true;

    corectrl = {
      enable = true;
      gpuOverclock.enable = true;
    };

    tmux = {
      enable = true;
      baseIndex = 1;
      keyMode = "vi";
      plugins = with pkgs; [
        ressurect
      ];
    };
  };

  virtualisation = {
    # waydroid.enable = true;
    libvirtd = {
      enable = true;
      qemu.package = pkgs.qemu;
    };
  };

  hardware.opentabletdriver.enable = true;

  boot = {
    extraModulePackages = with config.boot.kernelPackages; [zenpower];
    blacklistedKernelModules = [ "k10temp" ];
  };

  # Allow systemd to handle coredumps.
  systemd.coredump.enable = true;

  system.stateVersion = stateVersion;
}
