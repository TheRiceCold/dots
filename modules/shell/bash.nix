{ pkgs, ... }:
{
  programs = {
    bash = {
      enable = true;
      shellAliases = {
        cd      = "z";
        v       = "nvim";
        x       = "exit";
        c       = "clear";
        rmr     = "rm -r";
	      code    = "codium";
        l       = "joshuto";
        pipes   = "pipes.sh";
        wifi    = "doas nmtui";
        trc     = "transmission-cli";
        dot     = "codium ~/dotfiles";
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