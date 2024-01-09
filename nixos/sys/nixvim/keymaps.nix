{
  programs.nixvim.keymaps = [
    # Buffers
    { mode = "n"; key = "<leader>bn"; action = ":bnext<CR>"; }
    { mode = "n"; key = "<leader>bb"; action = ":bprev<CR>"; }
    { mode = "n"; key = "<leader>c"; action = ":bdelete<CR>"; }

    # Better window navigation
    { mode = "n"; key = "<C-h>"; action = "<C-w>h"; options.silent = true; }
    { mode = "n"; key = "<C-j>"; action = "<C-w>j"; options.silent = true; }
    { mode = "n"; key = "<C-k>"; action = "<C-w>k"; options.silent = true; }
    { mode = "n"; key = "<C-l>"; action = "<C-w>l"; options.silent = true; }

    { mode = "n"; key = "<leader>e"; action = ":NvimTreeToggle<CR>"; }

    # { mode = "i"; key = "<C-c>"; action = "<esc>"; }

    { key = "<m-1>"; action = ":ToggleTerm<CR>"; }
    # { key = "<m-3>"; action = ":ToggleTerm dir=float"; }
  ];
}
