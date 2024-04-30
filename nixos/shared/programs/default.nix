{ lib, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    gcc
    lsof
    wget
    clang
    gnumake
    unzip p7zip
    home-manager
    nix-output-monitor
    podman-tui podman-compose
  ];

  programs = {
    adb.enable = true;
    git.enable = true;
    light.enable = true;
    dconf.enable = true;
    nano.enable = false;
    less.enable = lib.mkDefault false; # I'd rather use bat

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    nh = {
      enable = true;
      flake = "/home/wolly/dots";
    };

    bash = import ./bash.nix;
  };
}
