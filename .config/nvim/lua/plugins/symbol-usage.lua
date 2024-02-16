local use_signcolumn = false

-- documented implementation, see https://github.com/Wansmer/symbol-usage.nvim/tree/d9578780b760ca22cbe7dd618cc880b155b0e84a/lua?tab=readme-ov-file#bubbles
local function h(name)
  return vim.api.nvim_get_hl(0, { name = name })
end

-- hl-groups can have any name
vim.api.nvim_set_hl(0, "SymbolUsageRounding", { fg = h("CursorLine").bg, italic = false })
vim.api.nvim_set_hl(0, "SymbolUsageContent", { bg = h("CursorLine").bg, fg = h("Comment").fg, italic = false })
vim.api.nvim_set_hl(0, "SymbolUsageRef", { fg = h("Function").fg, bg = h("CursorLine").bg, italic = false })
vim.api.nvim_set_hl(0, "SymbolUsageDef", { fg = h("Type").fg, bg = h("CursorLine").bg, italic = false })
vim.api.nvim_set_hl(0, "SymbolUsageImpl", { fg = h("@keyword").fg, bg = h("CursorLine").bg, italic = false })

local function text_format(symbol)
  local res = {}

  local round_start = { "", "SymbolUsageRounding" }
  local round_end = { "", "SymbolUsageRounding" }

  if symbol.references and symbol.references > 0 then
    local usage = symbol.references <= 1 and "usage" or "usages"
    local num = symbol.references == 0 and "no" or symbol.references
    table.insert(res, round_start)
    table.insert(res, { "󰌹 ", "SymbolUsageRef" })
    table.insert(res, { ("%s %s"):format(num, usage), "SymbolUsageContent" })
    table.insert(res, round_end)
  end

  if symbol.definition and symbol.definition > 0 then
    if #res > 0 then
      table.insert(res, { " ", "NonText" })
    end
    table.insert(res, round_start)
    table.insert(res, { "󰳽 ", "SymbolUsageDef" })
    table.insert(res, { symbol.definition .. " defs", "SymbolUsageContent" })
    table.insert(res, round_end)
  end

  if symbol.implementation and symbol.implementation > 0 then
    if #res > 0 then
      table.insert(res, { " ", "NonText" })
    end
    table.insert(res, round_start)
    table.insert(res, { "󰡱 ", "SymbolUsageImpl" })
    table.insert(res, { symbol.implementation .. " impls", "SymbolUsageContent" })
    table.insert(res, round_end)
  end

  return res
end

-- signcolumn experiment

if use_signcolumn then
  vim.api.nvim_create_autocmd({ "LspDetach" }, {
    callback = function(ev)
      vim.fn.sign_unplace("SymbolUsage")
    end,
  })
end

vim.fn.sign_define("SymbolUsageRef", { text = "󰌹", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("SymbolUsageDef", { text = "󰳽", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("SymbolUsageImpl", { text = "", texthl = "", linehl = "", numhl = "" })

local function signcolumn_format(symbol)
  local ns_id = vim.api.nvim_get_namespaces()["__symbol__"]
  local emark = vim.api.nvim_buf_get_extmark_by_id(0, ns_id, symbol.mark_id, { details = false })
  local buf = vim.api.nvim_get_current_buf()

  vim.fn.sign_unplace("SymbolUsage", { buffer = buf, id = symbol.mark_id })

  if #emark > 0 then
    if symbol.references then
      vim.fn.sign_place(symbol.mark_id, "SymbolUsage", "SymbolUsageRef", buf, { lnum = emark[1] + 1, priority = 11 })
    end

    if symbol.definition then
      vim.fn.sign_place(symbol.mark_id, "SymbolUsage", "SymbolUsageDef", buf, { lnum = emark[1] + 1, priority = 11 })
    end

    if symbol.implementation > 0 then
      vim.fn.sign_place(symbol.mark_id, "SymbolUsage", "SymbolUsageImpl", buf, { lnum = emark[1] + 1, priority = 11 })
    end
  end

  return ""
end

return {
  "Wansmer/symbol-usage.nvim",
  enabled = false,
  -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
  event = (function()
    if vim.fn.has("nvim-0.10") ~= 0 then
      return "LspAttach"
    end
    return "BufReadPre"
  end)(),
  config = function()
    ---@type UserOpts
    require("symbol-usage").setup({
      request_pending_text = "",
      implementation = { enabled = true },
      definition = { enabled = false },
      references = { enabled = false },
      text_format = use_signcolumn and signcolumn_format or text_format,
      vt_position = use_signcolumn and "end_of_line" or "above",
      symbol_request_pos = "end",
    })
  end,
}
