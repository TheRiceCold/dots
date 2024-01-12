{ pkgs, ... }:
{
  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_US.UTF-8";
  console.useXkbConfig = true;

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
    ripgrep

    neovim
		cargo
		nodejs
  ];

  services = {
    dbus.enable = true;
    openssh.enable = true;
  };
}
