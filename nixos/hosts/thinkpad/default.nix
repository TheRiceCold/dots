{ pkgs, name, ... }:

{
  imports = [ 
    ./hyprland.nix
    ./hardware-configuration.nix 
  ];

  networking.hostName = name;

  environment.systemPackages = with pkgs;[
    # Utilities
    unzip
    linux-wifi-hotspot

    # Podman tools
    podman-tui
    podman-compose
  ];

  programs = {
    adb.enable = true;
    virt-manager.enable = true;
  };

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.package = pkgs.qemu;
    };

    # waydroid.enable = true;
  };

  hardware.opentabletdriver.enable = true;

  services = {
    create_ap = {
      enable = true; 
      settings = {
        SSID = "wolly";
        PASSPHRASE = "1234qwer";
        WIFI_IFACE = "wlp1s0";
        INTERNET_IFACE = "enp3s0f0";
      };
    };

    flatpak.enable = true;
  };

  system.stateVersion = "23.11";
}
