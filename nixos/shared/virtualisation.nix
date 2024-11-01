{
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    # podman = let
    #   dockerEnabled = config.virtualisation.docker.enable;
    # in {
    #   enable = true;
    #   dockerCompat = !dockerEnabled;
    #   dockerSocket.enable = !dockerEnabled;
    #   defaultNetwork.settings.dns_enable = true;
    # };
  };
}
