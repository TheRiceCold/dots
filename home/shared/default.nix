{ inputs, user, stateVersion, ... }:
{
  imports = [ ./cli ./dev ./firefox ./bash.nix ];

  home = {
    username = user;
    stateVersion = stateVersion;
    homeDirectory = "/home/${user}";
  };

  nixpkgs.overlays = with inputs; [ nur.overlay ];
}
