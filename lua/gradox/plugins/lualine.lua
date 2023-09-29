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
          globalstatus = 3,
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
  }
}
