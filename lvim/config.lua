vim.opt.relativenumber = false
lvim.plugins= { -- Lua
  {
    "folke/twilight.nvim",
    keys = { { "<leader>t", "<cmd>Twilight<cr>", desc = "Twilight" } },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },

  },
  {
    "Jezda1337/nvim-html-css",
  },
}
