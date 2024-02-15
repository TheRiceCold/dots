let
  cmd = exec: "<cmd>${exec}<cr>";
  lua = arg: cmd "lua ${arg}";
  lead = key: "<leader>${key}";
  telescope = arg: (cmd "Telescope ${arg} theme=ivy");

  k = insert: key: action: desc: {
    inherit key action;
    options.desc = desc;
    mode = if insert == true then "i" else "";
  };

  git = key: act: desc: (k "" (lead "g${key}") act desc);
  buffer = key: act: desc: (k "" (lead key) (cmd act) desc);
  find = key: act: desc: (k "" (lead "f${key}") (telescope act) desc);
in [
  (k ""  "<S-u>" "<C-r>" "Redo")
  (k "" "<S-l>" (cmd "bnext") "Next buffer")
  (k "" "<S-h>" (cmd "bprevious") "Previous buffer")

  # Buffers
  (buffer "b" "enew" "New Buffer")
  (buffer "w" "write" "Write Buffer")
  (buffer "d" "bdelete" "Delete Buffer")

  # Telescope
  (find "f" "fd" "Find files")
  (find "b" "buffers" "Find buffers")
  (find "k" "keymaps" "Find keymaps")
  (find "j" "jumplist" "Find jumplist")
  (find "g" "live_grep" "Find live grep")
  (find "e" "file_browser" "Browse explorer")
  (find "a" "fd follow=true hidden=true" "Find all files")

  # Git
  (git "g" (cmd "LazyGit") "Lazygit")
  (git "s" (telescope "git_status") "Git status")
  (git "b" (telescope "git_branches") "Git Branches")

  # Utils
  (k "" (lead "e") (lua "MiniFiles.open()") "Explorer")

  # Options
  (k "" (lead "n") (cmd "set nu!") "Toggle line numbers")
]
