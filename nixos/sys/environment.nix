{ pkgs, ... }:
{ 
  environment = {
    systemPackages = with pkgs; [
      git
      fzf
      btop
      lsof
      unzip
      wget
      gcc
      clang
      gnumake
      killall
      ripgrep

      # Neovim pkg and lsp dependencies
      neovim
      cargo
      nodejs

      # Podman tools
      podman-tui
      podman-compose
    ];

    # loginShellInit = ''
    #   if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    #     exec Hyprland
    #   fi
    # '';
  };
}
