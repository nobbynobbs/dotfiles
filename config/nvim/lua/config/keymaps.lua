-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- override default floating terminal using terminal with borders
local Util = require("lazyvim.util")
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root(), border = "rounded" })
end

vim.keymap.set("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
vim.keymap.set("n", "<leader>fT", function()
  Util.terminal(nil, { border = "rounded" })
end, { desc = "Terminal (cwd)" })
vim.keymap.set("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
vim.keymap.set("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
-- disable windows nav in floating terminal
-- ctrl + l almost make me crazy
vim.keymap.del("t", "<c-l>", {})
vim.keymap.del("t", "<c-h>", {})
vim.keymap.del("t", "<c-j>", {})
vim.keymap.del("t", "<c-k>", {})

-- disable arrows in normal and visual modes
vim.keymap.set({ "v", "n" }, "<up>", "<nop>", { desc = "disable arrows" })
vim.keymap.set({ "v", "n" }, "<down>", "<nop>", { desc = "disable arrows" })
vim.keymap.set({ "v", "n" }, "<left>", "<nop>", { desc = "disable arrows" })
vim.keymap.set({ "v", "n" }, "<right>", "<nop>", { desc = "disable arrows" })

-- half page scrolling
vim.keymap.set("n", "<c-d>", "<c-d>zz", { desc = "scroll half page and center" })
vim.keymap.set("n", "<c-u>", "<c-u>zz", { desc = "scroll half page and center" })
