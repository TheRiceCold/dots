{
  shellAliases = let
    nix-clean = "nh clean all";
    nix-update = "doas nix flake update";
    nix-switch = "git add . ; nh os switch";
    nix-rollback = "doas nixos-rebuild switch --rollback";
  in {
    x = "exit";
    v = "nvim";
    f = "fuck";
    c = "clear";
    m = "mv -iv";
    cp = "cp -riv";
    np = "nix profile";
    hm = "home-manager";

    docker-compose = "podman-compose";

    hm-switch = "git add . ; nh home switch";

    inherit nix-clean nix-update nix-switch nix-rollback;
    nix-clean-switch = "${nix-clean}; ${nix-switch}";
    nix-update-switch = "${nix-update}; ${nix-switch}";
    nix-full-switch = "${nix-clean}; ${nix-update}; ${nix-switch}";
  };

  interactiveShellInit = /* bash */ ''
    nix-update-input() {
      nix flake lock --update-input $1
    }

    nix-upgrade() {
      nix profile upgrade $1
    }
  '';
}
