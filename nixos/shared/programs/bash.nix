{
  shellAliases = {
    x = "exit";
    v = "nvim";
    f = "fuck";
    c = "clear";
    m = "mv -iv";
    cp = "cp -riv";
    np = "nix profile";
    hm = "home-manager";
    wttr = "http://wttr.in";

    docker-compose = "podman-compose";
    nix-update = "doas nix flake update";
    nix-rollback = "doas nixos-rebuild switch --rollback";
  };

  interactiveShellInit = /* bash */ ''

    hm-switch() {
      git add . ; home-manager switch --flake .
    }

    nix-clean() {
      doas nix-collect-garbage -d
    }

    nix-switch() {
      git add . ; doas nixos-rebuild switch --flake .#$1
    }

    nix-clean-switch() {
      nix-clean; nix-switch $1
    }

  '';
}
