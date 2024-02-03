{ pkgs, ... }:
{
  imports = [
    ./nix.nix
    ./boot.nix
    ./users.nix
    ./hardware.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./environment.nix
    ./virtualisation.nix
  ];

  console.useXkbConfig = true;
  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_US.UTF-8";
  documentation.nixos.enable = false; # .desktop

  sound.enable = true;
  networking.networkmanager.enable = true;

  fonts.packages = with pkgs; [ 
    jetbrains-mono 
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
