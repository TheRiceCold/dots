{ inputs, pkgs, ... }:
{
  nix = {
    settings = {
      auto-optimise-store = true; # Optimize syslinks
      # experimental-features = [ "nix-command" "flakes" ];
    };

    gc = {
      automatic = true;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };

    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [ "nixpkgs=${channelPath}" ];
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };
}
