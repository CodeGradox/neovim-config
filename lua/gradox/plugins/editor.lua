return {
  -- Git wrapper for vim.
  "tpope/vim-fugitive",

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

  -- Automatically end certain structutes such as "end" in Ruby.
  -- "tpope/vim-endwise",

  -- Automatically end quotes, parenthesis, brackets and more.
  "raimondi/delimitmate",

  -- Comment stuff out.
  -- Toggle linewise comment: gc
  -- Toggle blockwise comment: gb
  -- Uncomment: gcgc
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  -- Telescope, a highly extendable fuzzy finder.
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        -- Native C port of fzf.
        "nvim-telescope/telescope-fzf-native.nvim",
        -- It may seem that I have to run this command manually.
        build = "make",
      },
    },
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
            theme = "dropdown",
            previewer = false,
          },
          git_files = {
            theme = "dropdown",
            previewer = false,
          },
          live_grep = {
            theme = "dropdown"
          },
        },
      }
      require("telescope").load_extension("fzf")
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
}
