{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gcc
    lsof
    wget
    clang
    gnumake
    home-manager

    unzip
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

    # fzf = {
    #   keybindings = true;
    #   fuzzyCompletion = true;
    # };

    thefuck.enable = true;
    tmux = {
      enable = true;
      keyMode = "vi";
      baseIndex = 1;
    };
    less.enable = lib.mkDefault false; # I'd rather use bat

    bash = import ./bash.nix;
  };
}
