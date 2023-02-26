return {
  -- A collection of common configurations for Neovim"s built-in language
  -- server client.
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Load the LSP servers.
      require("gradox.lsp")
    end
  },

  -- Enable treesitter. It"s still considered experimental.
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
          -- Enable better syntax highlights.
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },
  -- For debugging.
  -- :TSInstall query
  -- Toggle with :TSPlaygroundToggle
  "nvim-treesitter/playground",
}
