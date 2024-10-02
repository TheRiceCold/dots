let
  np = "nix profile";
  clean = "nh clean all";
  update = "doas nix flake update";
  switch = "doas nixos-rebuild switch";
  switch-flake = "git add . ; ${switch} --flake .\#$1";
in
{
  shellAliases = {
    x = "exit";
    v = "nvim";
    c = "clear";
    m = "mv -iv";
    cp = "cp -riv";

    hm = "home-manager";
    home-switch = "git add . ; nh home switch";

    # Package Installations
    gh-add = "${np} install github:$1";
    pkg-add = "${np} install nixpkgs\#$1";
    upgrade = "git add . ; ${np} upgrade $1";

    rollback = "${switch} --rollback";
    update-input = "nix flake lock --update-input $1"; # nix-up-input <input>
    update-switch = "${update}; ${switch}"; # nix-up-switch <hostname>
    clean-switch = "${clean}; ${switch-flake}"; # nix-clean-switch <hostname>
    full-switch = "${clean}; ${update}; ${switch-flake}"; # nix-full-switch <hostname>

    inherit
      np
      clean
      update
      switch-flake
      ;
  };

  interactiveShellInit = ''
    export PATH=$PATH:~/.local/bin
    export PS1="\[\e[33;41m\][\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]\[\e[33;41m\]]\[\e[m\]"
  '';
}
