{ pkgs, ... }:
{
  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_US.UTF-8";

  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    git
    fzf
    btop
    lsof
    unzip
    wget
    gcc
    clang
    gnumake
    ripgrep

    helix
    direnv
    lazygit
  ];

  programs.adb.enable = true;

  services.dbus.enable = true;
  services.openssh.enable = true;
}
