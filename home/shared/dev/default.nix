{ pkgs, ... }:
{
  imports = [ ./zed ./flutter.nix ];

  programs = {
    k9s.enable = true;
  };

  home.packages =
    with pkgs;
    with nodePackages;
    with python311Packages; [
    clang go # Compilers
    python3 pip pipx # Python3
    bun esbuild live-server  # JavaScript

    # awscli2
    # kubectl kubernetes-helm

    distrobox
    podman-tui
    podman-compose

    # Game Development
    godot_4           # Open source game engine
  ];
}
