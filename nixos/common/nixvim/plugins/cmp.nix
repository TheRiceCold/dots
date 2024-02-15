{
  programs.nixvim.plugins = {
    nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      experimental = { ghost_text = true; };
      performance = {
        debounce = 60;
        maxViewEntries = 30;
        fetchingTimeout = 200;
      };
      snippet.expand = "luasnip";
      window = {
        completion.border = "rounded";
        documentation.border = "rounded";
      };
      # sources = [
      #   { name = "nvim_lsp"; }
      #   {
      #     name = "buffer";
      #     keywordLength = 3;
      #     option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
      #   }
      #   { name = "path"; keyLength = 3; }
      #   { name = "luasnip"; keyboardLength = 3; }
      # ];

      # mappings = {

      # };
    };
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    # cmp-luasnip.enable = true;
  };
}
