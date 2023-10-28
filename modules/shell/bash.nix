{ pkgs, ... }:
{
  programs.bash = {
    shellAliases = {
      x = "exit";
      c = "clear";
      v = "~/.local/bin/lvim";

      wifi = "doas nmtui";
      trc = "transmission-cli";
      docker-compose = "podman-compose";
    };

    shellInit = ''
      export PATH = "$PATH:$HOME/.local/bin"

      killport() {
        kill $(lsof -t -i:$1) 
      }

      reflake() {
        doas nixos-rebuild switch --flake .#1
      }

      reflake_collect() {
        doas nix-collect-garbage -d && reflake $1
      }

      eval "$(zoxide init bash)"
      neofetch
    '';
  };
}
