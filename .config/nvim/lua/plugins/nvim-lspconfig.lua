return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
    ---@type lspconfig.options
    servers = {
      gopls = {
        settings = {
          gopls = {
            analyses = {
              -- defaults
              -- fieldalignment = true,
              -- nilness = true,
              -- unusedparams = true,
              -- unusedwrite = true,
              -- useany = true,
              -- custom
              unusedvariable = true,
              shadow = true,
            },
          },
        },
      },
    },
  },
}
