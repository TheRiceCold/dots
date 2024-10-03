{ pkgs, ... }: {
  imports = [
    ./nix.nix
    ./users.nix
    ./services.nix
    ./virtualisation.nix

    ./programs
  ];

  boot.loader = {
    timeout = 0;
    systemd-boot.enable = true; # Set to false if GRUB is enabled
    efi.canTouchEfiVariables = true;
  };

  console.useXkbConfig = true;
  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  security = {
    polkit.enable = true;
    rtkit.enable = true; # Enable real-time kit

    sudo.enable = false;
    doas = {
      enable = true;
      extraConfig = " permit nopass :wheel ";
    };
  };
}
