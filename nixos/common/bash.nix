{
  shellAliases = {
    x = "exit";
    v = "nvim";
    f = "fuck";
    c = "clear";
    m = "mv -iv";
    cp = "cp -riv";

    hm = "home-manager";
    docker-compose = "podman-compose";
    nix-update = "doas nix flake update";
    nix-rollback = "doas nixos-rebuild switch --rollback";
  };

  interactiveShellInit = /* bash */ ''

    __my-flakes() {
      cd ~/Flakes && git add .
    }

    hm-switch() {
      __my-flakes && home-manager switch --flake .
    }

    nix-clean() {
      doas nix-collect-garbage -d
    }

    nix-switch() {
      __my-flakes && doas nixos-rebuild switch --flake .#$1
    }

    nix-clean-switch() {
      nix-clean && nix-switch $1
    }

    # Run only on first instance
    # INFO: I added this for my pyprland scratchpad terminal at home/packages/desktop/hyprland/pypr.nix
    LIVE_COUNTER=$(ps a | awk '{print $2}' | grep -vi "tty*" | uniq | wc -l);
    if [ $LIVE_COUNTER -eq 1 ]; then
      neofetch
    fi

  '';
}
