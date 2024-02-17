{ pkgs, ... }:
{
  imports = [
    ./nix.nix
    ./users.nix
    ./hardware.nix
    ./services.nix
    ./virtualisation.nix
  ];

  boot = {
    loader = {
      timeout = 0;
      systemd-boot.enable = true; # Set to false if GRUB is enabled
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  console.useXkbConfig = true;
  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_US.UTF-8";
  documentation.nixos.enable = false; # .desktop

  environment.systemPackages = with pkgs; [
    gcc
    lsof
    wget
    clang
    gnumake
    home-manager
  ];

  sound.enable = true;
  networking.networkmanager.enable = true;

  programs = {
    git.enable = true;
    light.enable = true;
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  security = {
    sudo.enable = false;
    # Enable real-time kit
    rtkit.enable = true;

    doas = {
      enable = true;
      extraConfig = " permit nopass :wheel ";
    };
  };
}
