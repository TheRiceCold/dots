{ inputs, lib, pkgs, stateVersion, ... }: {
  imports = [
    ./nix.nix
    ./users.nix
    ./services.nix
    ./virtualisation.nix

    ./programs
  ];

  boot = {
    loader = {
      timeout = 0;
      systemd-boot.enable = true; # Set to false if GRUB is enabled
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };


  sound.enable = true;
  console.useXkbConfig = true;
  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
  };

  programs.adb.enable = true;
  services.udev.packages = [ pkgs.android-udev-rules ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  security = {
    polkit.enable = true;
    sudo.enable = false;
    # Enable real-time kit
    rtkit.enable = true;

    doas = {
      enable = true;
      extraConfig = " permit nopass :wheel ";
    };
  };
}
