return {
  -- Optional webicons.
  -- Install the desired font from https://www.nerdfonts.com/font-downloads
  -- Source Code Pro Nerd Font.
  "nvim-tree/nvim-web-devicons",

  -- Autocompletion with cmp-nvim
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp-signature-help",

  -- Snippets for cmp-nvim
  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",

  -- SYNTAX HIGHLIGHTLING (non-lsp)

  -- Highlight cells in CSV files.
  -- Allows me to query data in CSV with a SQL like syntax.
  {
    "mechatroner/rainbow_csv",
    ft = "csv",
  },

  -- Slim template language.
  {
    "slim-template/vim-slim",
    ft = "slim",
  },

  -- Git wrapper for vim.
  -- "tpope/vim-fugitive",

  -- Easily manage surrounding parentheses, brackets, quoutes, HTML tags and
  -- more.
  -- Keys: cs<char_from><char_to>
  -- Example: cs"" to change surrounding " to "
  "tpope/vim-surround",

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

  "folke/zen-mode.nvim",
}
