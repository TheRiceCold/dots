{ pkgs, unstable, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      fzf
      git         # Version Control
      btop        # Resource Manager
      lsof
      tmux
      unzip
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
      gcc
      git
      helix
      neovim
      zellij  # A terminal workspace 
      nushell # A modern shell
      linux-wifi-hotspot
    ]);
  };
}
