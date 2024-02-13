{ config, pkgs, name, stateVersion, ... }:
{
  imports = [
    # ./login-manager
    ./hardware-configuration.nix
  ];

  environment = {
    loginShellInit = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
    '';
    systemPackages = with pkgs; [
      # Utilities
      unzip
      linux-wifi-hotspot

      # Podman tools
      podman-tui
      podman-compose
    ];
  };

  networking.hostName = name;
  programs = {
    adb.enable = true;
    dconf.enable = true;
    virt-manager.enable = true;

    corectrl = {
      enable = true;
      gpuOverclock.enable = true;
    };

    tmux = {
      enable = true;
      baseIndex = 1;
      keyMode = "vi";
      plugins = with pkgs.tmuxPlugins; [
        resurrect
        continuum
        yank
        sensible
        vim-tmux-navigator
      ];
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = false;
    config.common.default = "*";
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  virtualisation = {
    # waydroid.enable = true;
    libvirtd = {
      enable = true;
      qemu.package = pkgs.qemu;
    };
  };

  services = {
    blueman.enable = true;
    create_ap = {
      enable = true;
      settings = {
        SSID = "wolly";
        PASSPHRASE = "1234qwer";
        WIFI_IFACE = "wlp1s0";
        INTERNET_IFACE = "enp3s0f0";
      };
    };

    upower.enable = true;
    power-profiles-daemon.enable = true;
  };

  security.polkit.enable = true;

  hardware = {
    opentabletdriver.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  boot = {
    blacklistedKernelModules = [ "k10temp" ];
    extraModulePackages = with config.boot.kernelPackages; [zenpower];
  };

  # Allow systemd to handle coredumps.
  systemd.coredump.enable = true;
  system.stateVersion = stateVersion;
}
