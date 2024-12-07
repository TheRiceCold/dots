{ lib, pkgs, ... }: {
  environment = {
    variables.EDITOR = "nvim";
    systemPackages = with pkgs; [
      nurl
      zoxide
      home-manager
    ];
  };

  programs = {
    adb.enable = true;
    git.enable = true;
    light.enable = true;
    dconf.enable = true;
    nano.enable = false;
    lazygit.enable = true;
    less.enable = lib.mkDefault false; # I'd rather use bat

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableBashIntegration = true;
    };

    nh = {
      enable = true;
      flake = "/home/wolly/dots";
    };

    bash = {
      shellAliases = {
        cd = "z";
        x = "exit";
        v = "nvim";
        c = "clear";
        m = "mv -iv";
        cp = "cp -riv";

        np = "nix profile";
        hm = "home-manager";
      };

      interactiveShellInit = /*sh*/ ''
        export PATH=$PATH:~/.local/bin

        eval "$(zoxide init bash)"
      '';
    };
  };
}
