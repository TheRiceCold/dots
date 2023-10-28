{ pkgs, unstable, ... }:

{
  environment = {
    variables = {
      TERMINAL = "kitty";
      EDITOR = "nvim";
      VISUAL = "emacs";
    };
    systemPackages = with pkgs; [
      fzf
      gcc
      git           # Version Control
      btop          # Resource Manager
      lsof
      tmux
      tree
      wget          # Retriever
      clang
      unzip
      gnumake
      lazygit
      ripgrep
      nix-tree      # Browse Nix Store
    ] ++ (with unstable; [
      neovim
    ]);
  };
}
