{ lib, ... }:
{
  programs = {
    zoxide = {
      enable = true;
      enableBashIntegration = true;
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
  };
}
