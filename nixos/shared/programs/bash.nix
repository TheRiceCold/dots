let
  np = "nix profile";
  clean = "nh clean all";
  update = "doas nix flake update";
  switch = "doas nixos-rebuild switch";
  switch-flake = "git add . ; ${switch} --flake .#$1";
in {
  shellAliases = {
    x = "exit";
    v = "nvim";
    c = "clear";
    m = "mv -iv";
    cp = "cp -riv";

    hm = "home-manager";
    home-switch = "git add . ; nh home switch";

    # Package Install
    git-add = "${np} install github:$1";
    pkgs-add = "${np} install nixpkgs#$1";
    update-input = "nix flake lock --update-input $1"; # nix-up-input <input>

    rollback = "${switch} --rollback";
    update-switch = "${update}; ${switch}"; # nix-up-switch <hostname>
    clean-switch = "${clean}; ${switch-flake}"; # nix-clean-switch <hostname>
    full-switch = "${clean}; ${update}; ${switch-flake}"; # nix-full-switch <hostname>

    inherit np clean update switch-flake;
  };

  interactiveShellInit = /* bash */ "export PATH=$PATH:~/.local/bin";
}
