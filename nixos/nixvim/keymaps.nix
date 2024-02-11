#TODO: Messy AF, need refactoring
[
	# Buffers
	{ mode = "n"; key = "<S-l>"; action = "<cmd>BufferLineCycleNext<cr>"; }
	{ mode = "n"; key = "<S-h>"; action = "<cmd>BufferLineCyclePrev<cr>"; }

  # Better window navigation
  { mode = ["n" "v"]; key = "<C-h>"; action = "<C-w>h"; options.silent = true; }
  { mode = ["n" "v"]; key = "<C-j>"; action = "<C-w>j"; options.silent = true; }
  { mode = ["n" "v"]; key = "<C-k>"; action = "<C-w>k"; options.silent = true; }
  { mode = ["n" "v"]; key = "<C-l>"; action = "<C-w>l"; options.silent = true; }

  { mode = ["n" "i" "v"]; key = "<A-k>"; action = "<esc>:m .+1<cr>"; options.silent = true; }
  { mode = ["n" "i" "v"]; key = "<A-j>"; action = "<esc>:m .-2<cr>"; options.silent = true; }
    # ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
    # -- Move current line / block with Alt-j/k ala vscode.
    # ["<A-k>"] = "<Esc>:m .-2<CR>==gi",

  { mode = "n"; key = "<S-u>"; action = "<C-r>"; options.silent = true; }

  { mode = ["n" "v"]; key = "<C-/>"; action = "<Plug>(comment_toggle_linewise_visual)"; }

  # LEADER KEYS
  # Buffers
  { mode = ["n" "v"]; key = "<leader>w"; action = "<cmd>write<cr>"; options.silent = true; }
  { mode = ["n" "v"]; key = "<leader>c"; action = "<cmd>bdelete<cr>"; options.silent = true; }
  { mode = ["n" "v"]; key = "<leader>n"; action = "<cmd>set nu!<cr>"; options.silent = true; }
  { mode = ["n" "v"]; key = "<leader>b"; action = "<cmd>enew<cr>"; options.silent = true; }

  # Telescope
  { mode = ["n" "v"]; key = "<leader>ff"; action = "<cmd>Telescope fd theme=ivy<cr>"; }
  { mode = ["n" "v"]; key = "<leader>fb"; action = "<cmd>Telescope buffers theme=ivy<cr>"; }
  { mode = ["n" "v"]; key = "<leader>/"; action = "<cmd>Telescope live_grep theme=ivy<cr>"; }
  { mode = ["n" "v"]; key = "<leader>fa"; action = "<cmd>Telescope find_file follow=true hidden=true theme=ivy<cr>"; }

  # Git
  { mode = ["n" "v"]; key = "<leader>gg"; action = "<cmd>Neogit<cr>"; }
  { mode = ["n" "v"]; key = "<leader>gs"; action = "<cmd>Telescope git_status theme=ivy<cr>"; }
  { mode = ["n" "v"]; key = "<leader>gb"; action = "<cmd>Telescope git_branch theme=ivy<cr>"; }

  # Utils
  { mode = ["n" "v"]; key = "<leader>e"; action = "<cmd>Oil<cr>"; }
]
