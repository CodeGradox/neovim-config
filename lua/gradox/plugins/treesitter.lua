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
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- The following parses will always be installed.
        ensure_installed = { "lua", "ruby", "javascript", "css", "html", "json", "yaml", "fish", "bash", "python" },
        ignore_install = {},
        -- Automatically install parsers for supported files.
        auto_install = true,
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        modules = {},
        indent = {
          -- There seems to be a bug in most languages where treesitter indent is not
          -- good enough.
          enable = false,
        },
        highlight = {
          -- Enable better syntax highlights.
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        textobjects = {
          select = {
            -- Better selection for objects, such as functions and classes.
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["as"] = "@scope",
            },
          },
          swap = {
            -- Swap order of parameters.
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
        },
        endwise = {
          enable = true,
        }
      })
    end
  },
  -- For debugging.
  -- :TSInstall query
  -- Toggle with :TSPlaygroundToggle
  {
    "nvim-treesitter/playground",
    cmd = { "TSPlaygroundToggle" }
  },
}
