{ pkgs, ... }:
{
  programs.bash = {
    shellAliases = {
      x = "exit";
      v = "lvim";
      c = "clear";

      wifi = "doas nmtui";
      trc = "transmission-cli";
      docker-compose = "podman-compose";
      
      flakes = "lvim ~/Flakes";
      emacsd = "lvim ~/.emacs.d";
      docker-docs = "podman run -ti -p 4000:4000 docs/docker.github.io:latest";

      rollback = "doas nixos-rebuild switch --rollback";
    };

    interactiveShellInit = ''
      export PATH="$PATH:$HOME/.local/bin"

      killport() {
        kill $(lsof -t -i:$1) 
      }

      reflake() {
        doas nixos-rebuild switch --flake .#$1
      }

      reflake_collect() {
        doas nix-collect-garbage -d && reflake $1
      }

      eval "$(zoxide init bash)"
      neofetch
    '';
  };
}
