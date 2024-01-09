let
  on-attach = ''
    function (bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
      vim.keymap.set("n", "v", api.node.open.vertical, opts "Open: Vertical Split")
      vim.keymap.del("n", "<C-k>", { buffer = bufnr })
      vim.keymap.set("n", "<S-k>", api.node.open.preview, opts "Open Preview")
    end
  '';

in {
  programs.nixvim = {
    plugins.nvim-tree.enable = true;

    extraConfigLua = ''
      require("nvim-tree").setup {
        on_attach = ${on-attach},
        hijack_netrw = false,
        sync_root_with_cwd = true,
        renderer = {
          add_trailing = false,
          group_empty = false,
          highlight_git = false,
          full_name = false,
          highlight_opened_files = "none",
          root_folder_label = ":t",
          indent_width = 2,
          indent_markers = {
            enable = false,
            inline_arrows = true,
            icons = {
              corner = "└",
              edge = "│",
              item = "│",
              none = " ",
            },
          },
          icons = {
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            glyphs = {
              default = " ",
              symlink = "",
              bookmark = "",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "󰉋 ",
                open = " ",
                empty = " ",
                empty_open = " ",
                symlink = " ",
                symlink_open = " ",
              },
              git = {
                unstaged = "",
                staged = "S",
                unmerged = "",
                renamed = " ",
                untracked = "U",
                deleted = " ",
                ignored = "◌",
              },
            },
          },
          special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
          symlink_destination = true,
        },
        update_focused_file = {
          enable = true,
          debounce_delay = 15,
          update_root = true,
          ignore_list = {},
        },

        diagnostics = {
          enable = true,
          show_on_dirs = false,
          show_on_open_dirs = true,
          debounce_delay = 50,
          severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
          },
          icons = {
            hint = "󰌶",
            info = "",
            warning = "",
            error = "",
          },
        },
      }
    '';
  };
}
