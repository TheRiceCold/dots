{ pkgs, ... }:
{
  programs = {
    bash = import ./bash.nix pkgs;

    nushell = {
      enable = true;
      shellAliases = {
        v = "nvim";
        c = "clear";
        yz = "yazi";
        curl = "curlie";
        np = "nix profile";
        hm = "home-manager";
      };
      configFile.source = ./config.nu;
    };

    carapace = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
    };

    # starship = { };
  };
}
