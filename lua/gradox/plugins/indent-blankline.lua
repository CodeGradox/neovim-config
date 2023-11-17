return {
  -- Visualize indentation.
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        exclude = {
          filetypes = { "slim" }
        },
        scope = {
          enabled = false,
          highlight = {
            -- Defined by my color scheme.
            "IndentBlanklineContextChar",
          }
        },
      })
    end,
  }
}
