-- NOTE: Plugins are loaded by gradox.plugin_manager.lua
-- Language Server Protocol (LSP)

local nvim_lsp = require("lspconfig")

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = function(client, bufnr)
  -- Shortcuts for keymaps and option setter.
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }
  -- Show line diagnostics.
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- Go to previous diagnostic.
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  -- Go to next diagnostic.
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- Show all diagnostics.
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

-- Ruby
-- gem install solargraph
nvim_lsp.solargraph.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

-- Javascript and typescript
-- npm -g install typescript typescript-language-server
nvim_lsp.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- ESLint
-- npm -g install eslint
-- nvim_lsp.eslint.setup {}

-- Vue
-- npm -g install vls
nvim_lsp.vuels.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    vetur = {
      -- Vls requires a jsconfig.json or tsconfig.json. Ignore that requirement.
      ignoreProjectWarning = true
    }
  }
}

-- Yaml
-- npm -g install yaml-language-server
nvim_lsp.yamlls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- Lua
-- brew install lua-language-server
nvim_lsp.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
