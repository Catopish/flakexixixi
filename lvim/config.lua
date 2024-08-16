vim.opt.relativenumber = true
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "javascript", "typescript", "css", "scss", "json", "html", "markdown" },
  },
}

-- Enable format on save
lvim.format_on_save = true

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

  {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
  "derektata/lorem.nvim",
  keys = { { "<leader>1", "<cmd>LoremIpsum 1 paragraphs<cr>", desc = "Lorem" } },
  config = function()
    require("lorem").setup({
      sentenceLength = "medium",
      comma_chance = 0.2,
      max_commas_per_sentence = 2,
    })
  end,
  },

  {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim'
    },
    config = function ()
        require'alpha'.setup(require'alpha.themes.theta'.config)
    end
  },

  {
  'stevearc/conform.nvim',
  opts = {},
  },
}
