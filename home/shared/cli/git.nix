{ pkgs, ... }:
{
  programs = {
    lazygit = {
      enable = true;
      settings = { };
    };

    gh = {
      enable = true;
      extensions = [pkgs.gh-markdown-preview];
      settings = {
        version = "1";
        prompt = "enabled";
        git_protocol = "ssh";
      };
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
