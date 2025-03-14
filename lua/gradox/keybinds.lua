-- Keybindings

-- Shortuct for setting keymaps
local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- nnoremap
local function nmap(shortcut, command)
  map("n", shortcut, command)
end

-- vnoremap
local function vmap(shortcut, command)
  map("v", shortcut, command)
end

-- tnoremap
local function tmap(shortcut, command)
  map("t", shortcut, command)
end

-- Map leader key to space
vim.g.mapleader = " "

-- Open Telescope
nmap("<leader>t", ":Telescope<cr>")

-- Find files using Telescope command-line sugar.
nmap("<leader>p", ":Telescope git_files<cr>")
nmap("<leader>p", ":Telescope git_files<cr>")
nmap("<leader>o", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
-- nmap("<leader>gco", ":Telescope git_branches<cr>")
nmap("<leader>1", ":Telescope lsp_document_symbols<cr>")
nmap("<leader>2", ":Telescope lsp_workspace_symbols<cr>")

-- Search for the text under the cursor.
vim.keymap.set("n", "<leader>s", function()
  require("telescope-live-grep-args.shortcuts").grep_word_under_cursor({ postfix = "" })
end, { desc = "Search word or selection"})

-- Search for the text under the cursor.
vim.keymap.set("v", "<leader>s", function()
  require("telescope-live-grep-args.shortcuts").grep_visual_selection({ postfix = "" })
end, { desc = "Search word or selection"})

-- Quickfix list shortcuts.
--Next item.
nmap("<leader>j", ":cn<CR>")
-- Previous item.
nmap("<leader>k", ":cp<CR>")

-- Make it easier to switch windows.
-- Ctrl + h, j, k or w to jump between splits.
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Exit edit mode in terminal, I think.
tmap("<C-q>", "<C-\\><C-n>")

-- Shift + J/K moves selected lines down/up in visual mode
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

-- Vim mappings for copying/pasting text to the os specific clipboard.
vmap("cp", "\"+y")

-- Toggle NvimTree
vim.keymap.set("n", "-", function()
  return require("nvim-tree.api").tree.find_file({ open = true, focus = true })
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>nn", function()
  return require("nvim-tree.api").tree.toggle()
end, { noremap = true, silent = true })

-- Gitsigns shortcuts
nmap("<leader>b", ":Gitsigns blame_line<cr>")

-- Lazygit
vim.keymap.set("n", "<leader>gg", function()
  vim.cmd("LazyGit")
end, { desc = "LazyGit" })
