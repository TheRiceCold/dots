let
  nix-clean = "nh clean all";
  nix-up = "doas nix flake update";
  nix-rollback = "doas nixos-rebuild switch --rollback";
in {
  shellAliases = {
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
    inherit nix-clean nix-up nix-rollback;
  };

  interactiveShellInit = /* bash */ ''
    # nix-up-input <input>
    nix-up-input() {
      nix flake lock --update-input $1
    }

    # nix-switch <hostname>
    nix-switch() {
      git add . ; doas nixos-rebuild switch --flake .#$1
    }

    # nix-clean-switch <hostname>
    nix-clean-switch() {
      ${nix-clean}; nix-switch $1
    }

    # nix-up-switch <hostname>
    nix-up-switch() {
      ${nix-up}; nix-switch $1
    }

    # nix-full-switch <hostname>
    nix-full-switch() {
      ${nix-clean}; ${nix-up}; nix-switch $1
    }

    # nixpkgs-add <package>
    nixpkgs-add() {
      nix profile install nixpkgs#$1
    }

    # nixgit-add <username/repository>
    nixgit-add() {
      nix profile install github:$1
    }
  '';
}
