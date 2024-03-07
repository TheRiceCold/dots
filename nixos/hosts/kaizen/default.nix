{ config, disk, pkgs, ... }:
{
  imports = [ ./services.nix ./hardware-configuration.nix ];

  disko = import disk;
  networking.hostName = "kaizen";

  environment = {
    systemPackages = with pkgs; [ linux-wifi-hotspot ];

    loginShellInit = /* bash */''

      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi

    '';
  };

  programs = {
    adb.enable = true;
    virt-manager.enable = true;
    corectrl = {
      enable = true;
      gpuOverclock.enable = true;
    };
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  virtualisation = {
    waydroid.enable = true;
    libvirtd = {
      enable = true;
      qemu.package = pkgs.qemu;
    };
  };

  security.pam.services.hyprlock = {};

  hardware = {
    opentabletdriver.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings.General.Experimental = true;
    };
  };

  boot = {
    blacklistedKernelModules = [ "k10temp" ];
    extraModulePackages = with config.boot.kernelPackages; [ zenpower ];
  };

  # Allow systemd to handle coredumps.
  systemd.coredump.enable = true;
}
