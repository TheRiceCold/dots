{
  programs.bash = {
    enable = true;
    shellAliases = {
      x = "exit";
      c = "clear";
      v = "lvim .";
      rollback = "doas nixos-rebuild switch --rollback";
    };
  };
}
