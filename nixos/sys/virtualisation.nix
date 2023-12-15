{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ podman-tui podman-compose ];
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
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
