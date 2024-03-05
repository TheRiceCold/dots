{ inputs, lib, pkgs, ... }:
let
  kaivim = inputs.kaivim.packages.${pkgs.system}.default;
in {
  environment.systemPackages = with pkgs; [
    bat btop
    # TODO: move this packages to kaivim
    lazygit ripgrep tectonic # kaivim
  ];

  programs = {
    nano.enable = false;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    fzf = {
      keybindings = true;
      fuzzyCompletion = true;
    };

    thefuck.enable = true;
    # wshowkeys.enable = true;
    bash = import ./bash.nix;
    less.enable = lib.mkDefault false; # I'd rather use bat
  };

  services.flatpak.enable = true;
}
