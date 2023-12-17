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
    killall
  ];

  services = {
    dbus.enable = true;
    openssh.enable = true;
  };
}
