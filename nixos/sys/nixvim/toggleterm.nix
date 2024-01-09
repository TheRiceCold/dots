{
  programs.nixvim = {
    extraConfigLua = ''

    '';
    plugins.toggleterm = {
      enable = true;
      size = 20;
      hideNumbers = true;
      closeOnExit = true; # close the terminal window when the process exits
      direction = "float";
      startInInsert = true;
      openMapping = "<m-3>";
      insertMappings = true; # whether or not the open mapping applies in insert mode
      floatOpts = {
        winblend = 0;
        border = "rounded";
      };
      winbar.enabled = true;
    };
  };
}
