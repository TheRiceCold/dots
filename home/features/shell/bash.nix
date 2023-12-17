{
  programs.bash = {
    enable = true;
    shellAliases = {
      v = "lvim";
      x = "exit";
      c = "clear";
      rollback = "doas nixos-rebuild switch --rollback";
    };
  };
}
