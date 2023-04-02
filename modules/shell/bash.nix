{ pkgs, ... }:
{
  programs = {
    bash = {
      enable = true;
      shellAliases = {
        cd = "z";
        v = "nvim";
        c = "clear";
        do = "doas";
      };
      initExtra = ''
        eval "$(zoxide init bash)"
        neofetch
      '';
    };
  };
}
