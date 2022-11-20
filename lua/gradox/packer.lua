
-- Use Packer as the plugin manager.
-- NOTE: Packer must be installed on your machine.
-- :help packer

-- Some of the plugins have an additional configuration step, denoted with the
-- `config = function ...` option. Inside this function, you'll see a `require`
-- call which will load a file/module from the plugin folder. This just means
-- that the plugin will setup additional settings after it has has been loaded.

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local use = require("packer").use

return require("packer").startup(function()
  -- Packer can manage itself.
  use "wbthomason/packer.nvim"

  -- Install the desired font from https://www.nerdfonts.com/font-downloads
  -- Source Code Pro Nerd Font
  use "kyazdani42/nvim-web-devicons" -- optional webicons

  -- A collection of common configurations for Neovim"s built-in language
  -- server client.
  use {
    "neovim/nvim-lspconfig",
    config = function()
      -- Load the LSP servers.
      require("gradox.lsp")
    end
  }

  -- Enable treesitter. It"s still considered experimental.
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("gradox.plugins.treesitter")
    end
  }
  -- For debugging.
  -- :TSInstall query
  -- Toggle with :TSPlaygroundToggle
  use "nvim-treesitter/playground"

  -- Enchance netrw
  -- Press `-` in normal mode to open netrw (:Explore).
  -- use "tpope/vim-vinegar"

  -- Git wrapper for vim.
  use "tpope/vim-fugitive"

  -- Easily manage surrounding parentheses, brackets, quoutes, HTML tags and
  -- more.
  -- Keys: cs<char_from><char_to>
  -- Example: cs"" to change surrounding " to "
  use "tpope/vim-surround"

  -- Automatically end certain structutes such as "end" in Ruby.
  use "tpope/vim-endwise"

  -- Automatically end quotes, parenthesis, brackets and more.
  use "raimondi/delimitmate"

  -- Comment stuff out.
  -- Toggle linewise comment: gc
  -- Toggle blockwise comment: gb
  -- Uncomment: gcgc
  -- use "tpope/vim-commentary"
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Extends support for abbreviations, substitutions and coercions.
  -- Abbreviation: Create powerful abbreviations
  -- Abolish will include upper and lower case words.
  -- Substitution: Better :s and :%s command
  -- :%s/facility/building/g will not convert plural and singular versions of
  -- the words. Subvert/facilit{y,ies}/building{,s}/g will substitute the words
  -- correcly.
  -- Coercion: Convert word from one case to another.
  -- crs       - snake_case
  -- crm       - MixedCase
  -- crc       - camelCase
  -- cru       - UPPER_CASE
  -- cr-       - dash-case
  -- cr.       - dot.case
  -- cr<space> - space case
  -- crt       - Title Case
  use "tpope/vim-abolish"

  -- Colorschemes
  use "CodeGradox/onehalf-lush"
  -- use "~/projects/onehalf-lush"

  -- Telescope, a highly extendable fuzzy finder.
  use {
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("gradox.plugins.telescope")
    end
  }
  -- Native C port of fzf.
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    branch = "main",
    requires = "nvim-telescope/telescope.nvim",
    config = function()
      require("gradox.plugins.telescope_fzf")
    end
  }

  -- Show git diffs inside a file.
  use {
    "mhinz/vim-signify",
    config = function()
      require("gradox.plugins.signify")
    end
  }

  -- Status/tabline, at the bottom of the editor.
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("gradox.plugins.lualine")
    end
  }

  -- Visualize indentation.
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("gradox.plugins.indent_blankline")
    end
  }

  -- A cutting-edge motion plugin.
  -- Invoke with "s".
  -- To delete, invoke with "dz", then follow up with the pattern.
  -- To find, invoke with "f".
  -- use "ggandor/lightspeed.nvim"
  use {
    "ggandor/leap.nvim",
    config = function ()
      require("leap").add_default_mappings()
    end
  }

  -- Autocompletion with cmp-nvim
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/nvim-cmp"

  -- Snippets for cmp-nvim
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"

  -- File explorer for neovim.
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons"
    },
    config = function()
      require("gradox.plugins.nvim-tree")
    end
  }

  -- SYNTAX HIGHLIGHTLING

  -- Highlight cells in CSV files.
  -- Allows me to query data in CSV with a SQL like syntax.
  use "mechatroner/rainbow_csv"

  -- Slim template language.
  use "slim-template/vim-slim"

  -- Support for Ruby on Rails.
  use {
    "tpope/vim-rails",
    config = function()
      require("gradox.plugins.vim_rails")
    end
  }
end)
