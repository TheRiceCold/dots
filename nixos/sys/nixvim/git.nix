{
  programs.nixvim.plugins = {
    gitsigns = {
      enable = true;
      currentLineBlame = true;
      signs = {
        add = { 
          text = "▎";
          hl = "GitSignsAdd";
          numhl = "GitSignsAddNr";
          linehl = "GitSignsAddLn";
        };
        change = { 
          text = "▎";
          hl = "GitSignsChange";
          numhl = "GitSignsChangeNr";
          linehl = "GitSignsChangeLn";
        };
        delete = { 
          text = "󰐊";
          hl = "GitSignsDelete";
          numhl = "GitSignsDeleteNr";
          linehl = "GitSignsDeleteLn";
        };
        topdelete = {
          text = "󰐊";
          hl = "GitSignsDelete";
          numhl = "GitSignsDeleteNr";
          linehl = "GitSignsDeleteLn";
        };
        changedelete = { 
          text = "▎";
          hl = "GitSignsChange";
          numhl = "GitSignsChangeNr";
          linehl = "GitSignsChangeLn";
        };
      };
      numhl = false;
      linehl = false;
      signcolumn = true;
      wordDiff = false;
      # watchGitdir = {
        # interval = 1000;
        # followFiles = true;
      # };
      # "current_line_blame_formatter" = "<author>, <author_time:%Y-%m-%d> - <summary>";
      previewConfig = {
        row = 0;
        col = 1;
        style = "minimal";
        border = "rounded";
        relative = "cursor";
      };
    };

    neogit = {
      enable = true;
    };
  };
}

