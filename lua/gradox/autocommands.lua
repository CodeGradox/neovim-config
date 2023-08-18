-- Autocommands

-- Trim trailing whitespace on save.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = "%s/\\s\\+$//e",
})

-- Overwrite global rules for certain filetypes.
-- Rust
-- vim.cmd [[autocmd filetype rs setlocal tabstop=4 shiftwidth=4 softtabstop=4]]
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rs" },
  command = "setlocal tabstop=4 shiftwidth=4 softtabstop=4",
})

-- Files which uses Ruby syntax.
vim.api.nvim_create_autocmd({ "BufNewFile", "BufEnter" }, {
  pattern = { "*.thor", "*.caracal", "*.jbuilder", "*.axlsx" },
  command = "set syntax=ruby",
})

-- Use internal formatting for bingings like `gq`.
vim.api.nvim_create_autocmd({ "LspAttach" }, {
  callback = function(args)
    vim.bo[args.buf].formatexpr = nil
  end
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.csv" },
  command = "setlocal nowrap",
})
