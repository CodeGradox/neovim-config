-- NOTE: Plugins are loaded by gradox.plugins.lua
-- Language Server Protocol (LSP)
-- Available language servers:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local nvim_lsp = require("lspconfig")

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  -- Shortcuts for keymaps and option setter.
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }
  -- Show line diagnostics.
  buf_set_keymap('n', '<space>de', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  -- Go to previous diagnostic.
  buf_set_keymap('n', '<space>dn', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  -- Go to next diagnostic.
  buf_set_keymap('n', '<space>dp', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- Show all diagnostics.
  buf_set_keymap('n', '<space>dq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
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
