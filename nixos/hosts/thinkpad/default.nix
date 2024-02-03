{ pkgs, name, stateVersion, ... }:

{
  imports = [ 
    # ./login-manager
    ./services.nix 
    ./environment.nix 
    ./hardware-configuration.nix 
  ];

  networking.hostName = name;
  programs = {
    adb.enable = true;
    virt-manager.enable = true;
  };

  virtualisation = {
    # waydroid.enable = true;
    libvirtd = {
      enable = true;
      qemu.package = pkgs.qemu;
    };
  };

  hardware.opentabletdriver.enable = true;

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  system.stateVersion = stateVersion;
}
