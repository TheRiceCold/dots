{
  programs.bash = {
    enable = true;
    shellAliases = {
      x = "exit";
      v = "lvim";
      c = "clear";
      hm = "home-manager";
      nix-rollback = "doas nixos-rebuild switch --rollback";
    };
    
    initExtra = ''
      eval "$(zoxide init bash)"
      eval "$(starship init bash)"
      eval "$(direnv hook bash)"
    '';
  };
}
