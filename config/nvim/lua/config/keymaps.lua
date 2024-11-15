-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- disable arrows in normal and visual modes
vim.keymap.set({ "v", "n" }, "<up>", "<nop>", { desc = "disable arrows" })
vim.keymap.set({ "v", "n" }, "<down>", "<nop>", { desc = "disable arrows" })
vim.keymap.set({ "v", "n" }, "<left>", "<nop>", { desc = "disable arrows" })
vim.keymap.set({ "v", "n" }, "<right>", "<nop>", { desc = "disable arrows" })

-- half page scrolling
vim.keymap.set("n", "<c-d>", "<c-d>zz", { desc = "scroll half page and center" })
vim.keymap.set("n", "<c-u>", "<c-u>zz", { desc = "scroll half page and center" })
