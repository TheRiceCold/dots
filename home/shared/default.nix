{ inputs, user, stateVersion, ... }: {
  imports = [
    ./cli
    ./bash.nix
    ./firefox
    ./qutebrowser
  ];

  home = {
    username = user;
    inherit stateVersion;
    homeDirectory = "/home/${user}";
  };

  nixpkgs.overlays = with inputs; [nur.overlay];
}
