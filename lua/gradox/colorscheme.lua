-- Color schemes

-- vim.opt.background = "dark"
vim.opt.background = "light"
vim.cmd [[colorscheme onehalf-lush]]

-- Highlight unwanted spaces in bright red.
vim.api.nvim_set_hl(0, "Whitespace", { bg = "#e45649", fg = "#ffffff" })
