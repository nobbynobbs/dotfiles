return {
  "Wansmer/symbol-usage.nvim",
  enabled = true,
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
      vt_position = "signcolumn",
      request_pending_text = "",
      implementation = { enabled = true },
      definition = { enabled = false },
      references = { enabled = false },
      text_format = function(symbol)
        if symbol.implementation then
          return { { "", "Constant" } }
        else
          return ""
        end
      end,
    })
  end,
}
