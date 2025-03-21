return {
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
          buffers = {
            sort_lastused = true,
            ignore_current_buffer = true,
            show_all_buffers = false,
            mappings = {
              n = {
                ["d"] = require("telescope.actions").delete_buffer,
              },
            }
          },
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
  }
}
