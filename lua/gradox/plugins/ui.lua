return {
  -- Status/tabline, at the bottom of the editor.
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      require("lualine").setup {
        options = {
          theme = "onehalf-lush",
          section_separators = '',
          component_separators = '|',
          -- globalstatus = 3,
        },
        sections = {
          lualine_b = {
            {
              "branch",
              "diff",
            }
          },
          lualine_c = {
            {
              "filename",
              -- Show relative path.
              path = 1,
            }
          },
          lualine_x = {
            {
              -- Show pending updates.
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = "#ff9e64" },
            },
            "diagnostics",
            "encoding",
            {
              "fileformat",
              icons_enabled = false
            },
            -- "filetype",
          }
        },
        -- Vim fugitive, show git status in the status bar.
        extensions = { "fugitive" },
      }
    end
  },

  -- Show git diffs inside a file.
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function ()
      require('gitsigns').setup()
    end
  },

  -- Visualize indentation.
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    config = function()
      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
      }
    end
  },

  -- File explorer for neovim.
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons"
    },
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 50
        }
      }
    end
  },
}
