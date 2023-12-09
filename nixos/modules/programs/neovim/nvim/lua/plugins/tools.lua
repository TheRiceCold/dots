return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Neorg", "NeorgOpen", "NeorgNew", "NeorgDoc" },
    event = "LazyFile",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.keybinds"] = {
          config = {
            default_keybinds = true,
            neorg_leader = "<leader>o",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond",
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              norg = "~/Documents/norg",
            },
            default_workspace = "norg",
          },
        },
        ["core.summary"] = {},
      },
    },
  },
}
