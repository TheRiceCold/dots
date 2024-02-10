{ shellAliases, ... }:
{
  programs.bash = {
    enable = true;
    inherit shellAliases; 
    initExtra = ''
      eval "$(zoxide init bash)"
      eval "$(starship init bash)"
      eval "$(direnv hook bash)"
    '';
  };
}
