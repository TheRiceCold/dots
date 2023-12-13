{ ... }:
{
  programs.bash = {
    shellAliases = {
      x = "exit";
      v = "nvim";
      c = "clear";

      wifi = "doas nmtui";
      trc = "transmission-cli";
      docker-compose = "podman-compose";
      rollback = "doas nixos-rebuild switch --rollback";

      # Config Shortcuts
      flakes = "lvim ~/Flakes";
      hyprland = "lvim ~/Flakes/nixos/modules/window-managers/hyprland";
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
    '';
  };
}
