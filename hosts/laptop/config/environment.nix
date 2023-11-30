{ pkgs, unstable, ... }:

let
in {
  environment = {
    variables = {
      TERMINAL = "kitty";
      EDITOR = "nvim";
      VISUAL = "emacs";
    };

    systemPackages = with pkgs; [
      fzf
      gcc
      git         # Version Control
      btop        # Resource Manager
      lsof
      tmux
      wget        # Retriever
      clang
      gnumake
      lazygit
      ripgrep
      nix-tree    # Browse Nix Store

      # tree
      # p7zip
      # usbutils    # Tools for working with USB devices
    ] ++ (with unstable; [
      neovim
      linux-wifi-hotspot
    ]);
  };
}
