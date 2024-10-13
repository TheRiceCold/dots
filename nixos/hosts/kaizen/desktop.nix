{ pkgs, ... }: {
  programs = {
    # droidcam.enable = true;
    virt-manager.enable = true;
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu.package = pkgs.qemu;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  services = {
    gvfs.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = false;
  };
}
