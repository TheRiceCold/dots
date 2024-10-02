{ stateVersion, ... }:
{
  nix = {
    settings = {
      auto-optimise-store = true; # Optimize syslinks
      trusted-users = [
        "root"
        "@wheel"
      ];
      experimental-features = "nix-command flakes";
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 3d";
    };
    optimise.automatic = true;
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

  system.stateVersion = stateVersion;
}
