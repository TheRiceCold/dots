 { 
   programs = {
    dconf.enable = true;
    light.enable = true;
    nano.enable = false;

    bash = {
      shellAliases = {
        x = "exit";
        v = "nvim";
        c = "clear";
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

    neovim = {
      enable = true;
      withRuby = true;
      withNodeJs = true;
      withPython3 = true;
      defaultEditor = true;
    };
  };
}
