return {
  -- Git wrapper for vim.
  "tpope/vim-fugitive",

  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewFocusFiles",
      "DiffviewLog",
      "DiffviewOpen",
      "DiffviewRefresh",
      "DiffviewToggleFiles",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.opt.fillchars = vim.opt.fillchars + 'diff:╱'
      require("diffview").setup()
    end
  },

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

  -- Collection of helpful plugins.
  -- {
  --   "echasnovski/mini.nvim",
  --   version = false,
  --   config = function ()
  --     -- Automatically end quotes, parenthesis, brackets and more.
  --     require("mini.pairs").setup()
  --   end
  -- },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  },

  -- Comment stuff out.
  -- Toggle linewise comment: gc
  -- Toggle blockwise comment: gb
  -- Uncomment: gcgc
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },

  -- Telescope, a highly extendable fuzzy finder.
  -- Press <C-q> to put the results into the quickfix list.
  -- While live grepping, press <C-k> to quote the search term. Then you can
  -- apply commands and paths to ripgrep.
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      {
        -- Native C port of fzf.
        "nvim-telescope/telescope-fzf-native.nvim",
        -- It may seem that I have to run this command manually.
        build = "make",
      },
    },
    config = function()
      local lga_actions = require("telescope-live-grep-args.actions")

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
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              -- In insert mode.
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              },
            },
            theme = "dropdown",
          }
        },
      }
      -- Setup extenstions.
      require("telescope").load_extension("live_grep_args")
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
