{
  programs.nixvim.keymaps = [
    # Better window navigation
    { mode = "n"; key = "<C-h>"; action = "<C-w>h"; options.silent = true; }
    { mode = "n"; key = "<C-j>"; action = "<C-w>j"; options.silent = true; }
    { mode = "n"; key = "<C-k>"; action = "<C-w>k"; options.silent = true; }
    { mode = "n"; key = "<C-l>"; action = "<C-w>l"; options.silent = true; }

    # Buffers
    { mode = "n"; key = "<S-l>"; action = "<cmd>bnext<cr>"; }
    { mode = "n"; key = "<S-h>"; action = "<cmd>bprevious<cr>"; }

    # Save File
    { mode = ["i" "x" "n" "s"]; key ="<C-s>"; action = "<cmd>w<cr><esc>"; }
  ];
}
