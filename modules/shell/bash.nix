{ pkgs, ... }:
{
  programs = {
    bash = {
      enable = true;
      shellAliases = {
        cd = "z";
        v = "lvim";
        x = "exit";
        c = "clear";
        rmr = "rm -r";
        l = "joshuto";
	      code = "codium";
        pipes = "pipes.sh";
        wifi = "doas nmtui";
        flakes = "lvim ~/Flakes";
        trc = "transmission-cli";
        docker-compose = "podman-compose";
      };

      initExtra = ''
        export PATH="$PATH:$HOME/.local/bin"

        killport() {
          kill $(lsof -t -i:$1) 
        }

        reflake() {
          doas nix-collect-garbage -d && doas nixos-rebuild switch --flake .#$1
        }

        reflake_bash() {
          reflake $1 && source ~/.bashrc
        }

        reflake_reboot() {
          reflake $1 && reboot
        }

        eval "$(zoxide init bash)"
        neofetch
      '';
    };
  };
}
