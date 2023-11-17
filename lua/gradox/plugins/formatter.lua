return {
  {
    "mhartington/formatter.nvim",
    cmd = { "Format", "FormatWrite" },
    config = function()
      require("formatter").setup({
        -- Formatters: https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
        filetype = {
          sql = {
            require("formatter.filetypes.sql").pgformat,
          },
          ruby = {
            require("formatter.filetypes.ruby").rubocop,
          },
          -- TODO: Replace tabs with 4 spaces.
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          -- javascript = {
          --   require("formatter.filetypes.javascript").prettier,
          -- },
        }
      })
    end
  }
}
