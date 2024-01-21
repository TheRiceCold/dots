''
  lvim.keys.normal_mode['<S-h>'] = '<cmd>BufferLineCyclePrev<cr>'
  lvim.keys.normal_mode['<S-l>'] = '<cmd>BufferLineCycleNext<cr>'

  lvim.builtin.which_key.mappings['f'] = {
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<CR>",
    'Find File'
  }

  lvim.builtin.which_key.mappings['st'] = {
    "<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy({}))<CR>",
    'Text'
  }
''
