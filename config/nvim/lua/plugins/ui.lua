return {
  {
    "rcarriga/nvim-notify",
    opts = {
      -- notifications appears and disappears in normal way
      stages = "static",
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        -- borders for docs
        lsp_doc_border = true,
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        animation = function()
          return 0
        end,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
