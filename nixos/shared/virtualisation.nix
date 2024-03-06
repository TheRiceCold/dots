{ config, ... }:
let
  dockerEnabled = config.virtualisation.docker.enable;
in {
  virtualisation = {
    # docker.enabled = true;
    podman = {
      enable = true;
      dockerCompat = !dockerEnabled;
      dockerSocket.enable = !dockerEnabled;
      defaultNetwork.settings.dns_enable = true;
    };
  };
}
