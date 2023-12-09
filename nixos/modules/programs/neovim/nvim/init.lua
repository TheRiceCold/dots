-- bootstrap lazy.nvim, LazyVim and your plugins
require('config.lazy')

-- Put anything you want to happen only in Neovide here
if vim.g.neovide then
  -- Font
  vim.o.guifont = 'JetBrainsMono Nerd Font'

  vim.g.neovide_cursor_vfx_mode = 'sonicboom'

  -- Scale
  vim.g.neovide_scale_factor = 0.85
end
