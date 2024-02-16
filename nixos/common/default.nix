{ inputs, lib, pkgs, ... }:
let
  kaivim = inputs.kaivim.packages.${pkgs.system}.default;
in {
  environment.systemPackages = with pkgs; [
    bat btop
    lazygit ripgrep kaivim # kaivim and dependencies
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
    wshowkeys.enable = true;
    bash = import ./bash.nix;
    less.enable = lib.mkDefault false; # I'd rather use bat
  };

  nixpkgs = {
    overlays = [ ];
  };
}
