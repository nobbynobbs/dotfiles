-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- vim.api.nvim_create_autocmd("TermOpen", {
--   callback = function()
--     vim.wo.signcolumn = "no"
--     vim.wo.number = false
--     vim.wo.relativenumber = false
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("TermClose", {
--   callback = function()
--     vim.wo.signcolumn = "yes"
--     vim.wo.number = true
--     vim.wo.relativenumber = true
--   end,
-- })

-- Disable autoformat for
-- python, yaml, markdown
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "python", "yaml", "markdown" },
  callback = function()
    vim.b.autoformat = false
  end,
})
