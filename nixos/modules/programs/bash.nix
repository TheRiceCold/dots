{ pkgs, ... }:
{
  programs.bash = {
    shellAliases = {
      x = "exit";
      v = "nvim";
      c = "clear";

      wifi = "doas nmtui";
      trc = "transmission-cli";
      docker-compose = "podman-compose";

      flakes = "nvim ~/nixos-flakes";
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
      eval "$(starship init bash)"

      eval "$(direnv hook bash)"

      neofetch

      # if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
      #   exec tmux
      # fi
    '';
  };
}
