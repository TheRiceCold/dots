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

      unzip
      # tree
      # p7zip
      # usbutils    # Tools for working with USB devices
    ] ++ (with unstable; [
      gcc
      linux-wifi-hotspot
    ]);
  };
}
