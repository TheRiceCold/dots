{ pkgs, ... }:
{
  # syntax-highlighting pager for git, diff, grep and blame output
  home.packages = [ pkgs.delta ];

  programs = {
    git = {
      enable = true;
      userName = "TheRiceCold";
      userEmail = "dalewaltergh@gmail.com";
      extraConfig = {
        color.ui = true;
        core = {
          editor = "nvim";
          pager = "delta";
        };
        interactive = {
          diffFilter = "delta --color-only";
        };
        delta = {
          navigate = true;
          line-numbers = true;
        };
        diff.colorMoved = "default";
        merge.conflictstyle = "diff3";
      };
    };

    # gh = {
    #   enable = true;
    #   extensions = [pkgs.gh-markdown-preview];
    #   settings = {
    #     version = "1";
    #     prompt = "enabled";
    #     git_protocol = "ssh";
    #   };
    # };

    lazygit = import ./lazygit.nix;
  };
}
