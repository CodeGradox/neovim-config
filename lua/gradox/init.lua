-- Bootstrap lazy.nvim.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  checker = {
    -- Automatically check for plugin updates.
    enabled = true,
    concurrency = 8,
    notify = false,
    -- Check for updates every hour.
    frequency = 3600,
  }
}

-- Setup the plugins!
require("gradox.keybinds")
require("lazy").setup("gradox.plugins", opts)
require("gradox.colorscheme")
require("gradox.settings")
require("gradox.autocommands")
require("gradox.abbreviations")
require("gradox.cmp")
