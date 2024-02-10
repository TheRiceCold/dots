 { 
   programs = {
    git.enable = true;
    light.enable = true;
    nano.enable = false;

    direnv = {
      enable = true; 
      nix-direnv.enable = true;
    };

    neovim = {
      enable = true;
      withRuby = true;
      withNodeJs = true;
      withPython3 = true;
      defaultEditor = true;
    };

    bash = {
      shellAliases = {
        x = "exit";
        v = "nvim";
        c = "clear";
        mv = "mv -iv";
        cp = "cp -riv";

        hm = "home-manager";
        docker-compose = "podman-compose";
        nix-update = "doas nix flake update";
        nix-rollback = "doas nixos-rebuild switch --rollback";
      };

      interactiveShellInit = ''
        nix-clean() {
          doas nix-collect-garbage -d
        }

        nix-switch() {
          cd ~/Flakes && git add . && doas nixos-rebuild switch --flake .#$1
        }
        
        nix-clean-switch() {
          nix-clean && nix-switch $1
        }
      '';
    };
  };
}
