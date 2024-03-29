# Neovim notification manager. Displays notifications as toast messages.
return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")

    notify.setup({
      fps      = 1,
      top_down = false,
    })

    vim.notify = notify
  end
}
