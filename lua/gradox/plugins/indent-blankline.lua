return {
  -- Visualize indentation.
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        scope = {
          enabled = true,
          highlight = {
            -- Defined by my color scheme.
            "IndentBlanklineContextChar",
          }
        },
      })
    end,
  }
}
