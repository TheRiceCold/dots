{ ... }:

{
  programs.bash = {
    shellAliases = {
      x = "exit";
      c = "clear";
      hm = "home-manager";
      rollback = "doas nixos-rebuild switch --rollback";
    };

    interactiveShellInit = ''
      killport() {
        kill $(lsof -t -i:$1) 
      }
    '';
  };
}
