{ inputs, user, stateVersion, ... }: {
  imports = [ ./cli ./firefox ./bash.nix ];

  home = {
    username = user;
    inherit stateVersion;
    homeDirectory = "/home/${user}";
  };

  nixpkgs.overlays = with inputs; [nur.overlay];
}
