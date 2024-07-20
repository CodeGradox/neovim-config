-- NOTE: Plugins are loaded by gradox.plugins.lua
-- Language Server Protocol (LSP)
-- Available language servers:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local nvim_lsp = require("lspconfig")

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { buffer = bufnr, remap = true, silent = true }
  -- Go to definition.
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  -- Hover over symbol to see documentation.
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  -- Show line diagnostics.
  vim.keymap.set('n', '<space>l', function() vim.diagnostic.open_float() end, opts)
  -- Go to previous diagnostic.
  vim.keymap.set('n', '<space>dn', function() vim.diagnostic.goto_prev() end, opts)
  -- Go to next diagnostic.
  vim.keymap.set('n', '<space>dp', function() vim.diagnostic.goto_next() end, opts)
  -- Show all diagnostics.
  vim.keymap.set('n', '<space>dq', function() vim.diagnostic.setloclist() end, opts)
end

vim.diagnostic.config({
  virtual_text  = true,
  -- Don't use the fancy LSP lines by default. Toggle it with a keybind.
  virtual_lines = false,
})

-- Configuration for diagnostic settings.
vim.diagnostic.config({
  virtual_text  = true,
  virtual_lines = false,
})

-- Table of LSP servers and their configurations.
local servers = {
  solargraph = {
    flags = {
      debounce_text_changes = 150,
    }
  },
  tsserver = {},
  vuels = {
    settings = {
      vetur = {
        ignoreProjectWarning = true
      }
    }
  },
  yamlls = {},
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  jsonls = {},
}

-- Loop through the servers table and set up each server
for server, config in pairs(servers) do
  config.capabilities = capabilities
  config.on_attach = on_attach
  nvim_lsp[server].setup(config)
end
