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
      btop        # Resource Manager
      lsof
      tmux
      wget        # Retriever
      gcc
      clang
      gnumake
      ripgrep
      lazygit
      libcxx

      unzip
      # tree
      # p7zip
      # nix-tree    # Browse Nix Store
      # usbutils    # Tools for working with USB devices
    ] ++ (with unstable; [
      git         # Version Control
      neovim
      linux-wifi-hotspot
    ]);
  };
}
