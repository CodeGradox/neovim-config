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
        filetype = {
          sql = {
            require("formatter.filetypes.sql").pgformat,
          },
          ruby = {
            require("formatter.filetypes.ruby").rubocop,
          },
          -- javascript = {
          --   require("formatter.filetypes.javascript").prettier,
          -- },
        }
      })
    end
  }
}
