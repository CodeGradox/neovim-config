return {
  {
    "CodeGradox/onehalf-lush",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.opt.background = "dark"
      vim.opt.background = "light"
      vim.cmd [[colorscheme onehalf-lush]]

      -- Highlight unwanted spaces in bright red.
      vim.api.nvim_set_hl(0, "Whitespace", { bg = "#e45649", fg = "#ffffff" })
    end
  }
}
