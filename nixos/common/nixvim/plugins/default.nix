{ pkgs, ... }:
{
  imports = [ ./cmp.nix ./utils ];
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [ lazygit-nvim ];
    plugins = {
      lsp = import ./lsp.nix;
      telescope = import ./telescope.nix ;

      inc-rename = { enable = true; };
      lualine = { enable = true; };
      markdown-preview.enable = true;

      noice.enable = true;
      nvim-cmp = { enable = true; };

      treesitter = {
        enable = true;
        indent = true;
	      folding = false;
        nixGrammars = true;
	      nixvimInjections = true;
        ensureInstalled = [ "comment" "markdown_inline" "regex" ];
      };
      treesitter-context.enable = true;
      rainbow-delimiters.enable = true;

      gitsigns = {
        enable = true;
        currentLineBlame = true;
      };
    };
    extraConfigLua = "require('telescope').load_extension('lazygit')";
  };
}
