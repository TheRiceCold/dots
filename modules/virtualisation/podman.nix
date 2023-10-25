{ pkgs, ... }:

{
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      # defaultNetwork.settings.dns_enabled = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true; # release 23.05
      # defaultNetwork.dnsname.enable = true; # use with older releases
    };
  };

  environment.systemPackages = with pkgs; [ podman-tui ];
}
