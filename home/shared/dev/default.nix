{ pkgs, ... }:
{
  imports = [
    ./zed
    ./flutter.nix
  ];

  programs = {
    k9s.enable = true;
  };

  home.packages =
    with pkgs;
    with nodePackages;
    with python311Packages;
    [
      # awscli2
      # kubectl kubernetes-helm

      gobang

      distrobox
      lazydocker
      # podman-tui
      # podman-compose

      # Game Development
      godot_4 # Open source game engine
    ];
}
