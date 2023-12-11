{ pkgs, unstable, ... }:

{
  environment = {
    variables = {
      EDITOR = "lvim";
      VISUAL = "lvim";
      TERMINAL = "foot";
    };

    systemPackages = with pkgs; [
      fzf
      btop        # Resource Manager
      lsof
      tmux
      unzip
      wget        # Retriever
      gcc
      clang
      gnumake
      ripgrep
      lazygit
      speedtest-cli

      # tree
      # p7zip
      # nix-tree    # Browse Nix Store
      # usbutils    # Tools for working with USB devices
    ] ++ (with unstable; [
      git
      neovim
      joshuto
      linux-wifi-hotspot
    ]);
  };
}
