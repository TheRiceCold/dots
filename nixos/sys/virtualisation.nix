{ pkgs, config, ... }:
let
  dockerEnabled = config.virtualisation.docker.enable;
in {
  environment.systemPackages = with pkgs; [ podman-tui podman-compose ];
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

  # Autostart QEMU/KVM in the first initialization of NixOS
  # source:  https://nixos.wiki/wiki/Virt-manager
  # dconf.settings = {
  #   "org/virt-manager/virt-manager/connections" = {
  #     autoconnect = [ "qemu://system" ];
  #     uris = [ "qemu://system" ];
  #   };
  # };
}
