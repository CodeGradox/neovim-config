-- NOTE: Plugins are loaded by gradox.plugins.lua
-- Language Server Protocol (LSP)
-- Available language servers:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local nvim_lsp = require("lspconfig")

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local go_to_definition = function()
  vim.lsp.buf.definition()
  -- Delay the centering of the cursor to allow the LSP to jump to the definition.
  vim.defer_fn(function()
    vim.cmd("normal! zz")
  end, 100)
end

local on_attach = function(client, bufnr)
  -- Mappings
  local opts = { buffer = bufnr, remap = true, silent = true }

  -- Go to definition.
  vim.keymap.set('n', 'gd', go_to_definition, opts)
  -- Split window vertically and go to definition.
  vim.keymap.set('n', 'gv', function() vim.cmd[[vsplit]]; go_to_definition() end, opts)
  -- Split window horizontally and go to definition.
  vim.keymap.set('n', 'gs', function() vim.cmd[[split]]; go_to_definition() end, opts)
  -- Loop up references.
  vim.keymap.set('n', 'gh', function() vim.lsp.buf.references() end, opts)
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
  -- Rename symbol under the cursor.
  vim.keymap.set('n', '<space>rn', function() vim.lsp.buf.rename() end, opts)

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

vim.diagnostic.config({ virtual_text = true })


-- Table of LSP servers and their configurations.
local servers = {
  solargraph = {
    flags = {
      debounce_text_changes = 150,
    }
  },
  ts_ls = {},
  -- volar = {}, -- Vue language server
  yamlls = {
    settings = {
      yaml = {
        format = {
          enable = true,
        },
        keyOrdering = true,
        validate = true,
        completion = true,
      }
    }
  },
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
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
  gopls = {
    settings = {
      gopls = {
        analyses = {
          append = true,
          assign = true,
          atomic = true,
          atomicalign = true,
          bools = true,
          composites = true,
          defers = true,
          deprecated = true,
          fillreturns = true,
          infertypeargs = true,
          nilness = true,
          printf = true,
          shadow = true,
          shift = true,
          simplifyrange = true,
          simplifyslice = true,
          sortslice = true,
          tests = true,
          unreachable = true,
          unusedparams = true,
          unusedvariable = true,
          unusedwrite = true,
        },
        gofumpt = true,
        hints = {
          -- compositeLiteralFields = true,
          -- parameterNames = true,
          rangeVariableTypes = true,
        },
        -- usePlaceholders = true,
        staticcheck = true,
      },
    },
  },
  cssls = {},
  html = {},
}

-- Loop through the servers table and set up each server
for server, config in pairs(servers) do
  config.capabilities = capabilities
  config.on_attach = on_attach
  nvim_lsp[server].setup(config)
end
