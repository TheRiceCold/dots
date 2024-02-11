{ 
   programs = {
    git.enable = true;
    light.enable = true;
    nano.enable = false;

    direnv = {
      enable = true; 
      nix-direnv.enable = true;
    };

    # neovim = {
      # enable = true;
      # withRuby = true;
      # withNodeJs = true;
      # withPython3 = true;
      # defaultEditor = true;
    # };

    bash = {
      shellAliases = {
        x = "exit";
        v = "nvim";
        c = "clear";
        m = "mv -iv";
        cp = "cp -riv";

        hm = "home-manager";
        docker-compose = "podman-compose";
        nix-update = "doas nix flake update";
        nix-rollback = "doas nixos-rebuild switch --rollback";
      };

      interactiveShellInit = ''
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
      '';
    };
  };
}
