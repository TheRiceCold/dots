{ pkgs, ... }: 
{
  imports = [ 
    ./bat.nix
    ./tmux.nix
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

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    lazygit.enable = true;

    # File Explorer
    yazi = {
      enable = true;
      package = pkgs.yazi;
    };

    # zellij = {
    #   enable = true;
    #   package = pkgs.zellij;
    # };

    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };
  };


  home.packages = with pkgs; [
    cava
    figlet
    ydotool
    onefetch
  ];
}
