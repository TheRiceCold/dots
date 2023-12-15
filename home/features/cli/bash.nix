{
  programs.bash = {
    enable = true;
    shellAliases = {
      x = "exit";
      c = "clear";
      hm = "home-manager";
      rollback = "doas nixos-rebuild switch --rollback";
    };
  };
}
