{ pkgs, config, ... }:
let
  dockerEnabled = config.virtualisation.docker.enable;
in {
  programs.virt-manager.enable = true;

  virtualisation = {
    # docker.enabled = true;

    podman = {
      enable = true;
      dockerCompat = !dockerEnabled;
      dockerSocket.enable = !dockerEnabled;
      defaultNetwork.settings.dns_enable = true;
    };

    libvirtd = {
      enable = true;
      qemu.package = pkgs.qemu;
    };

    # waydroid.enable = true;
  };
}
