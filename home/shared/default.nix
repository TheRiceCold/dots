{ inputs, user, stateVersion, ... }:
{
  imports = [
    ./cli
    ./helix
    ./firefox
    ./shell.nix
  ];

  home = {
    username = user;
    stateVersion = stateVersion;
    homeDirectory = "/home/${user}";
  };

  nixpkgs.overlays = with inputs; [ nur.overlay ];
}
