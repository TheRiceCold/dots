{
  programs.bash = {
    enable = true;
    shellAliases = {
      x = "exit";
      c = "clear";
      rollback = "doas nixos-rebuild switch --rollback";
    };
  };
}
