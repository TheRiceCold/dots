return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'tailwindcss-language-server',
        'typescript-language-server',
        'css-lsp',
        'rnix-lsp',
      })
    end,
  },
}
