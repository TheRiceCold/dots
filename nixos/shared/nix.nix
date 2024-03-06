{ stateVersion, ... }:
{
  nix = {
    settings = {
      auto-optimise-store = true; # Optimize syslinks
      experimental-features = "nix-command flakes";
    };

    gc = {
      automatic = true;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

  system.stateVersion = stateVersion;
}
