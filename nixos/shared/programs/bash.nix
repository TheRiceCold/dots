let
  nix-clean = "nh clean all";
  nix-update = "doas nix flake update";
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
    inherit nix-clean nix-update nix-rollback;
  };

  interactiveShellInit = /* bash */ ''
    # nix-update-input <input>
    nix-update-input() {
      nix flake lock --update-input $1
    }

    # nix-upgrade <index>
    nix-upgrade() {
      nix profile upgrade $1
    }

    # nix-switch <hostname>
    nix-switch() {
      git add . ; doas nixos-rebuild switch --flake .#$1
    }

    # nix-clean-switch <hostname>
    nix-clean-switch() {
      ${nix-clean}; nix-switch $1
    }

    # nix-update-swtich <hostname>
    nix-update-switch() {
      ${nix-update}; nix-switch $1
    }

    # nix-full-swtich <hostname>
    nix-full-switch() {
      ${nix-clean}; ${nix-update}; nix-switch $1
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
