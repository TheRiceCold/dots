{
  imports = [ ./utils ];
  programs.nixvim.plugins = { 
    lsp = import ./lsp.nix;
    packer = import ./packer.nix;
    telescope = import ./telescope.nix ;

    inc-rename = { enable = true; };
    lualine = { enable = true; };
    markdown-preview.enable = true;

    noice.enable = true;
    nvim-cmp = { enable = true; };

    # Git
    neogit.enable = true;
    gitsigns = { enable = true; };

    treesitter = {
      enable = true;
      indent = true;
      nixGrammars = true;
      ensureInstalled = [ "comment" "markdown_inline" "regex" ];
    };
  };
}
