{
  programs.nixvim.plugins = {
    gitsigns = {
      enable = true;
      currentLineBlame = true;
      signs = {
        add = { };
        change = { };
        delete = { };
        topdelete = { };
        changedelete = { };
      };
    };

    neogit = {
      enable = true;
    };
  };
}

