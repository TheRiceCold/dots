{ lib, pkgs, ... }: {
  environment = {
    variables.EDITOR = "nvim";
    systemPackages = with pkgs; [
      lsof
      wget
      gnumake
      unrar
      unzip
      p7zip

      nurl
      home-manager
      nix-output-monitor
    ];
  };

  programs = {
    bash = import ./bash.nix;

    adb.enable = true;
    git.enable = true;
    dconf.enable = true;
    light.enable = true;
    nano.enable = false;
    less.enable = lib.mkDefault false;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    nh = {
      enable = true;
      flake = "/home/wolly/dots";
    };
  };
}
