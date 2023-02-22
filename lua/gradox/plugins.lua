-- Bootstrap lazy.nvim.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Packer can manage itself.
  "wbthomason/packer.nvim",

  -- Optional webicons.
  -- Install the desired font from https://www.nerdfonts.com/font-downloads
  -- Source Code Pro Nerd Font.
  "kyazdani42/nvim-web-devicons",

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
      require("gradox.plugins.treesitter")
    end
  },
  -- For debugging.
  -- :TSInstall query
  -- Toggle with :TSPlaygroundToggle
  "nvim-treesitter/playground",
  -- Git wrapper for vim.
  "tpope/vim-fugitive",

  -- Easily manage surrounding parentheses, brackets, quoutes, HTML tags and
  -- more.
  -- Keys: cs<char_from><char_to>
  -- Example: cs"" to change surrounding " to "
  "tpope/vim-surround",

  -- Automatically end certain structutes such as "end" in Ruby.
  "tpope/vim-endwise",

  -- Automatically end quotes, parenthesis, brackets and more.
  "raimondi/delimitmate",

  -- Comment stuff out.
  -- Toggle linewise comment: gc
  -- Toggle blockwise comment: gb
  -- Uncomment: gcgc
  -- "tpope/vim-commentary"
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

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
  "tpope/vim-abolish",

  -- Colorschemes
  {
    "CodeGradox/onehalf-lush",
    lazy = false,
  },
  -- "~/projects/onehalf-lush"

  -- Telescope, a highly extendable fuzzy finder.
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Native C port of fzf.
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    config = function()
      require("gradox.plugins.telescope")
    end
  },

  -- Show git diffs inside a file.
  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("gradox.plugins.gitsigns")
    end
  },

  -- Status/tabline, at the bottom of the editor.
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("gradox.plugins.lualine")
    end
  },

  -- Visualize indentation.
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("gradox.plugins.indent_blankline")
    end
  },

  -- A cutting-edge motion plugin.
  -- Invoke with "s".
  -- To delete, invoke with "dz", then follow up with the pattern.
  -- To find, invoke with "f".
  -- "ggandor/lightspeed.nvim"
  {
    "ggandor/leap.nvim",
    config = function ()
      require("leap").add_default_mappings()
    end
  },

  -- Autocompletion with cmp-nvim
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/nvim-cmp",

  -- Snippets for cmp-nvim
  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",

  -- File explorer for neovim.
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons"
    },
    config = function()
      require("gradox.plugins.nvim-tree")
    end
  },

  -- SYNTAX HIGHLIGHTLING

  -- Highlight cells in CSV files.
  -- Allows me to query data in CSV with a SQL like syntax.
  "mechatroner/rainbow_csv",

  -- Slim template language.
  "slim-template/vim-slim",
}

local opts = {}

require("lazy").setup(plugins, opts)
