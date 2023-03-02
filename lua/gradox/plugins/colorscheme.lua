return {
  {
    "CodeGradox/onehalf-lush",
    -- dir = "~/projects/onehalf-lush",
    dependencies = {
      "f-person/auto-dark-mode.nvim",
    },
    lazy = false,
    priority = 1000,
    config = function()
      local function set_light_mode()
        vim.api.nvim_set_option("background", "light")
        vim.cmd("colorscheme onehalf-lush")
      end

      local function set_dark_mode()
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme onehalf-lush-dark")
      end

      -- I think the background is set to dark by default.
      if vim.api.nvim_get_option("background") == "dark" then
        set_dark_mode()
      else
        set_light_mode()
      end

      -- Highlight unwanted spaces in bright red.
      vim.api.nvim_set_hl(0, "Whitespace", { bg = "#e45649", fg = "#ffffff" })

      local auto_dark_mode = require('auto-dark-mode')

      -- Automatically set the colorscheme based on the macOS theme.
      auto_dark_mode.setup({
        -- update_interval = 1000,
        set_dark_mode = set_dark_mode,
        set_light_mode = set_light_mode,
      })

      auto_dark_mode.init()
    end
  }
}
