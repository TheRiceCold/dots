let
  shellAliases = {
    x = "exit";
    v = "lvim";
    c = "clear";
    mv = "mv -iv";
    cp = "cp -riv";

    hm = "home-manager";
    nix-rollback = "doas nixos-rebuild switch --rollback";
  };
in { 
  imports = [ 
    ./git.nix
    ./starship.nix
    (import ./bash.nix { inherit shellAliases; })
    # (import ./nushell.nix { inherit pkgs shellAliases; })
  ];
}
