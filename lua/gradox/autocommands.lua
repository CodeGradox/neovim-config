-- Autocommands

-- Trim trailing whitespace on save.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*",
  callback = function ()
    local filetype = vim.bo.filetype
    if filetype == "rust" or filetype == "go" or filetype == "yaml" then
      vim.lsp.buf.format()
    else
      vim.cmd([[%s/\\s\\+$//e]])
    end
  end
})

-- Custom rules for rust.
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "rust",
  callback = function()
    vim.opt.softtabstop = 4
    vim.opt.tabstop     = 4
    vim.opt.shiftwidth  = 4
  end
})

-- Custom rules for go.
vim.api.nvim_create_autocmd({ "Filetype" }, {
  pattern = "go",
  callback = function()
    vim.opt.softtabstop = 4
    vim.opt.tabstop     = 4
    vim.opt.shiftwidth  = 4
    vim.opt.expandtab   = false
  end
})

vim.api.nvim_create_autocmd({ "Filetype" }, {
  pattern = { "csv" },
  command = "setlocal nowrap",
})

-- Files which uses Ruby syntax.
vim.api.nvim_create_autocmd({ "BufNewFile", "BufEnter" }, {
  pattern = { "*.thor", "*.caracal", "*.jbuilder", "*.axlsx", "*.cap" },
  command = "set syntax=ruby",
})

-- Use internal formatting for bingings like `gq`.
vim.api.nvim_create_autocmd({ "LspAttach" }, {
  callback = function(args)
    vim.bo[args.buf].formatexpr = nil
  end
})
