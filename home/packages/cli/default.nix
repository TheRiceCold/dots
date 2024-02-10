{ pkgs, ... }: 
{
  imports = [ 
    ./bat.nix
    ./zellij.nix
    ./kubernetes.nix
    ./neofetch
  ];

  programs = {
    btop = {
      enable = true;
      settings = {
        vim_keys = true;
        rounded_corners = true;
        theme_background = false;
        color_theme = "tokyo-storm";
      };
    };

    lazygit.enable = true;

    # File Explorer
    yazi = {
      enable = true;
      package = pkgs.yazi;
    };
  };

  home.packages = with pkgs; [
    eza # Modern replacement for ls
    cava
    figlet
    ydotool
    onefetch
    pipes-rs
  ];
}
