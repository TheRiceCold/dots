let
  lead = key: "<leader>${key}";
  cmd = exec: "<cmd>${exec}<cr>";
  lua = arg: cmd "lua ${arg}";

  # Modes (n: Normal, nv: Normal, Visual)
  n = key: action: { mode = "n"; inherit key action; };
  nv = key: action: { mode = ["n" "v"]; inherit key action; };
  niv = key: action: { mode = ["n" "i" "v"]; inherit key action; };

  buffer = key: arg: (nv (lead key) (cmd arg));
  telescope = arg: cmd "Telescope ${arg} theme=ivy";
  find = key: arg: (nv (lead "f${key}") (telescope arg));
  git = key: arg: (nv (lead "g${key}") arg);

  term = opts: (lua "require('toggleterm.terminal').Terminal:new({ ${opts}, hidden = true, on_open = function(_) vim.cmd 'startinsert!' end, }):toggle()");
in [
  (n "<S-l>" (cmd "bnext")) # Switch to next buffer
  (n "<S-h>" (cmd "bprevious")) # Switch to previous buffer

  (n "<S-u>" "<C-r>") # Redo map

  # Buffers
  (buffer "b" "enew") # New Buffer
  (buffer "w" "write") # Write Buffer
  (buffer "d" "bdelete") # Delete Buffer

  # Telescope
  (find "f" "fd") # Find files
  (find "b" "buffers") # Find Buffers
  (find "t" "live_grep") # Find Text (Global)
  (find "a" "fd follow=true hidden=true") # Find files (including hidden files)

  # Git
  (git "g" (cmd "Neogit"))
  (git "l" (term "cmd = 'lazygit' "))
  (git "s" (telescope "git_status"))
  (git "b" (telescope "git_branches"))

  # Utils
  (nv (lead "e") (lua "MiniFiles.open()"))

  # Options
  (nv (lead "n") (cmd "set nu!")) # Toggle line numbers
]
