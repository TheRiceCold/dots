{ ... }:

{
  programs.bash = {
    shellAliases = {
      x = "exit";
      v = "nvim";
      c = "clear";
      hm = "home-manager";
      rollback = "doas nixos-rebuild switch --rollback";
    };

    interactiveShellInit = ''
      rebuild() {
        cd ~/Flakes && git add . && doas nixos-rebuild switch --flake .#$1
      }
      
      rebuild_collect() {
        rebuild $1 && doas nix-collect-garbage -d
      }

      killport() {
        kill $(lsof -t -i:$1) 
      }
    '';
  };
}
