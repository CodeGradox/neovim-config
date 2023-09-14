return {
  -- Autocompletion with cmp-nvim
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/nvim-cmp",

  -- Snippets for cmp-nvim
  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",

  -- SYNTAX HIGHLIGHTLING (non-lsp)

  -- Highlight cells in CSV files.
  -- Allows me to query data in CSV with a SQL like syntax.
  "mechatroner/rainbow_csv",

  -- Slim template language.
  "slim-template/vim-slim",

  {
    "ErichDonGubler/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end
  },

  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        -- Formatters: https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
        filetype = {
          sql = {
            require("formatter.filetypes.sql").pgformat,
          },
          ruby = {
            require("formatter.filetypes.ruby").rubocop,
          },
          -- TODO: Replace tabs with 4 spaces.
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          -- javascript = {
          --   require("formatter.filetypes.javascript").prettier,
          -- },
        }
      })
    end
  },

  {
    -- Copilot is a plugin that suggests code based on the current file.
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          auto_refresh = true,
        },
        suggestion = {
          auto_trigger = true,
          -- CTRL + l to accept suggestion
          -- CTRL + j to go to next suggestion
          -- CTRL + k to go to previous suggestion
          keymap = {
            accept = "<C-l>",
            next = "<C-j>",
            prev = "<C-k>",
          },
        },
        filetypes = {
          ruby       = true,
          javascript = true,
          python     = true,
          slim       = true,
          html       = true,
          erb        = true,
          sql        = true,
        }
      })
    end,
  }
}
