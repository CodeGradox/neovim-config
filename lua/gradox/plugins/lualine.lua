return {
  -- Status/tabline, at the bottom of the editor.
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      local git_blame = require("gitblame")

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
            -- {
            --   -- Show pending updates.
            --   require("lazy.status").updates,
            --   cond = require("lazy.status").has_updates,
            -- },
            "diagnostics",
            {
              git_blame.get_current_blame_text,
              cond = git_blame.is_blame_text_available,
            },
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
