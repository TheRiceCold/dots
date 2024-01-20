{ pkgs, ... }:
{
  home = {
    packages = [ pkgs.lunarvim ];
    file.".config/lvim/config.lua".text = ''
      lvim.keys.insert_mode['<C-d>'] = '<Esc>'
      lvim.keys.normal_mode['<S-h>'] = '<cmd>BufferLineCyclePrev<cr>'
      lvim.keys.normal_mode['<S-l>'] = '<cmd>BufferLineCycleNext<cr>'

      lvim.transparent_window = true
      lvim.builtin.alpha.active = false
      -- lvim.builtin.alpha.mode = 'dashboard'
      lvim.builtin.terminal.active = true
      lvim.builtin.nvimtree.setup.view.side = 'left'
      lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

      lvim.builtin.treesitter.auto_install = true

      lvim.builtin.which_key.mappings['f'] = {
        "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<CR>",
        'Find File'
      }
      lvim.builtin.which_key.mappings['st'] = {
        "<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy({}))<CR>",
        'Text'
      }

      lvim.colorscheme = 'catppuccin'

      lvim.plugins = {
        {
          'catppuccin/nvim',
          name = 'catppuccin',
          priority = 1000,
        },
        {
          'folke/noice.nvim',
          event = 'VeryLazy',
          dependencies = {
            'MunifTanjim/nui.nvim',
            -- { 'rcarriga/nvim-notify', opts = { timeout = 1000, fps = 60, } },
          },
          config = function()
            local noice = require 'noice'
            noice.setup {
              presets = {
                bottom_search = false,        -- use a classic bottom cmdline for search
                command_palette = false,      -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false,       -- add a border to hover docs and signature help
              },
            }
          end,
        },
      }
    '';
  };
}
