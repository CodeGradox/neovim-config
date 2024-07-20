local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local noop = function() end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- Disable the - key to prevent me from accidentaly navigating to the parent directory.
  vim.keymap.set('n', '-', noop, { buffer = bufnr, noremap = true, silent = true, nowait = true })
  -- vim.keymap.set('n', '<Alt-->', function() print("Hello") end, { buffer = bufnr, noremap = true, silent = true, nowait = true })
end

return {
  -- File explorer for neovim.
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 50
        },
        on_attach = my_on_attach
      }
    end
  }
}
