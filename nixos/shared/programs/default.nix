{ lib, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    gcc
    lsof
    wget
    clang
    gnumake
    home-manager

    unzip
    p7zip
    nix-prefetch-github

    # Podman tools
    podman-tui
    podman-compose
  ];

  programs = {
    adb.enable = true;
    git.enable = true;
    light.enable = true;
    dconf.enable = true;
    nano.enable = false;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    less.enable = lib.mkDefault false; # I'd rather use bat

    bash = import ./bash.nix;
  };
}
