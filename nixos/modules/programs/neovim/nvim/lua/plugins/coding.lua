return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      filetypes = { ["*"] = true },
      suggestion = { enabled = true, auto_trigger = true },
    },
  },

  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
}
