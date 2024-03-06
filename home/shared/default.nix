{ inputs, stateVersion, ... }:
{
  imports = [ ./cli ./helix ./shell.nix ];

  home = {
    username = "wolly";
    stateVersion = stateVersion;
    homeDirectory = "/home/wolly";
  };

  nixpkgs.overlays = with inputs; [ nur.overlay ];
}
