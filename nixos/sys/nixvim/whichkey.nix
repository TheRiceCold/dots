let
  cmd = exec: "<cmd>${exec}<CR>";

  main = {
    write = (cmd "w!");
    close = cmd "BufferKill";
    quit = cmd "confirm q";
    tree = cmd "NvimTreeToggle";
    comment = "<Plug>(comment_toggle_linewise_current)";
    find-files = cmd "lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))";
  };

  buffers = {
    jump = cmd "BufferLinePick";
    prev = cmd "BufferLineCyclePrev";
    next = cmd "BufferLineCycleNext";
    find = cmd "Telescope buffers previewer=false";
  };

  # Debug
  dap = exec: cmd "lua require'dap'.${exec}()";
  telescope = exec: cmd "Telescope ${exec}";

  search = { 
    colorscheme = cmd "Telescope colorscheme";
  };

  git = { };
in {
  programs.nixvim = {
    plugins.which-key.enable = true;
    extraConfigLua = ''
      local mappings = {
        [";"] = { "${cmd "Alpha"}", "Dashboard" },
        ["w"] = { "${main.write}", "Save" },
        ["q"] = { "${main.quit}", "Quit" },
        ["/"] = { "${main.comment}", "Comment toggle current line" },
        ["c"] = { "${main.close}", "Close Buffer" },
        ["f"] = { "${main.find-files}", "Find File" },
        ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
        ["e"] = { "${main.tree}", "Explorer" },

        b = {
          name = "Buffers",
          j = { "${buffers.jump}", "Jump" },
          f = { "${buffers.find}", "Find" },
          b = { "${buffers.prev}", "Previous" },
          n = { "${buffers.next}", "Next" },
          W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
          e = {
            "<cmd>BufferLinePickClose<cr>",
            "Pick which buffer to close",
          },
          h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
          l = {
            "<cmd>BufferLineCloseRight<cr>",
            "Close all to the right",
          },
          D = {
            "<cmd>BufferLineSortByDirectory<cr>",
            "Sort by directory",
          },
          L = {
            "<cmd>BufferLineSortByExtension<cr>",
            "Sort by language",
          },
        },
        d = {
          name = "Debug",
          t = { "${dap "breakpoint"}", "Toggle Breakpoint" },
          b = { "${dap "step-back"}", "Step Back" },
          c = { "${dap "continue"}", "Continue" },
          C = { "${dap "run_to_cursor"}", "Run To Cursor" },
          d = { "${dap "disconnect"}", "Disconnect" },
          g = { "${dap "session"}", "Get Session" },
          i = { "${dap "step_into"}", "Step Into" },
          o = { "${dap "step_over"}", "Step Over" },
          u = { "${dap "step_out"}", "Step Out" },
          p = { "${dap "pause"}", "Pause" },
          r = { "${dap "repl.toggle"}", "Toggle Repl" },
          s = { "${dap "continue"}", "Start" },
          q = { "${dap "close"}", "Quit" },
          U = { "<cmd>lua require'dapui'.toggle({ reset = true })<cr>", "Toggle UI" },
        },

        g = {
          name = "Git",
          j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
          k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
          l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
          p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
          r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
          R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
          s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
          u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
          },
          o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
          b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
          c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
          C = {
            "<cmd>Telescope git_bcommits<cr>",
            "Checkout commit(for current file)",
          },
          d = {
            "<cmd>Gitsigns diffthis HEAD<cr>",
            "Git Diff",
          },
        },
        l = {
          name = "LSP",
          a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
          d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
          w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
          -- f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", "Format" },
          i = { "<cmd>LspInfo<cr>", "Info" },
          I = { "<cmd>Mason<cr>", "Mason Info" },
          j = {
            "<cmd>lua vim.diagnostic.goto_next()<cr>",
            "Next Diagnostic",
          },
          k = {
            "<cmd>lua vim.diagnostic.goto_prev()<cr>",
            "Prev Diagnostic",
          },
          l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
          q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
          r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
          s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
          S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols",
          },
          e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
        },

        s = {
          name = "Search",
          b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
          c = { "${search.colorscheme}", "Colorscheme" },
          f = { "<cmd>Telescope find_files<cr>", "Find File" },
          h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
          H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
          M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
          r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
          R = { "<cmd>Telescope registers<cr>", "Registers" },
          t = { "<cmd>Telescope live_grep<cr>", "Text" },
          k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
          C = { "<cmd>Telescope commands<cr>", "Commands" },
          l = { "<cmd>Telescope resume<cr>", "Resume last search" },
          p = {
            "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
            "Colorscheme with Preview",
          },
        },
        T = {
          name = "Treesitter",
          i = { ":TSConfigInfo<cr>", "Info" },
        },
      }

      local which_key = require "which-key"

      which_key.setup {
        plugins = {
          marks = false,
          registers = false,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
          presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = false,
            g = false,
          },
        },
        operators = { gc = "Comments" },
        icons = {
          breadcrumb = "»",
          separator = "",
          group = "",
        },
        popup_mappings = {
          scroll_down = "<c-d>",
          scroll_up = "<c-u>",
        },
        window = {
          border = "single", -- none, single, double, shadow
          position = "bottom", -- bottom, top
          margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
          padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
          winblend = 0,
        },
        layout = {
          height = { min = 4, max = 25 },
          width = { min = 20, max = 50 },
          spacing = 3, -- spacing between columns
          align = "left", -- align columns left, center or right
        },
        ignore_missing = true,
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
        show_help = true,
        show_keys = true,
        triggers = "auto",
        triggers_blacklist = {
          i = { "j", "k" },
          v = { "j", "k" },
        },
        disable = {
          buftypes = {},
          filetypes = { "TelescopePrompt" },
        },
      }

      local opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
      }

      which_key.register(mappings, opts)
    '';
  };
}
