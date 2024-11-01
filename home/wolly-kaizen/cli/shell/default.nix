{
  programs = {
    nushell = {
      enable = true;
      shellAliases = {
        v = "nvim";
        c = "clear";
        yz = "yazi";
        curl = "curlie";
        hm = "home-manager";
      };
      configFile.source = ./config.nu;
    };
    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
    zoxide = {
      enable = true;      
      enableNushellIntegration = true;
    };
    # starship = { };
  };
}
