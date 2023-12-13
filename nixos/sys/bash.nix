{ ... }:

{
  programs.bash = {
    shellAliases = {
      x = "exit";
      c = "clear";
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
    '';
  };
}
