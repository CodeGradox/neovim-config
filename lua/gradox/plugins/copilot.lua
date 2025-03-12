return {
  {
    -- Copilot is a plugin that suggests code based on the current file.
    "zbirenbaum/copilot.lua",
    -- enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          auto_refresh = true,
        },
        suggestion = {
          auto_trigger = true,
          debounce_ms = 150,
          -- CTRL + l to accept suggestion
          -- CTRL + j to go to next suggestion
          -- CTRL + k to go to previous suggestion
          keymap = {
            accept = "<C-l>",
            next   = "<C-j>",
            prev   = "<C-k>",
            accept_word = "<C-f>",
            accept_line = "<C-d>",
          },
        },
        filetypes = {
          erb = false,
          slim = false,
        },
      })
    end,
  }
}
