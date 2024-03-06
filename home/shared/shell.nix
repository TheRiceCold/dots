{ lib, ... }:
{
  programs = {
    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };

    git = {
      enable = true;
      userName = "TheRiceCold";
      userEmail = "dalewaltergh@gmail.com";
      extraConfig = {
        color.ui = true;
        core.editor = "nvim";
      };
    };

    bash = {
      enable = true;
      shellAliases = {
        lg = "lazygit";
      };

      initExtra = /* bash */ ''
        eval "$(zoxide init bash)"
      '';
    };
  };
}
