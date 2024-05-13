return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports" },
      },
    },
  },
  {
    "leoluz/nvim-dap-go",
    opts = {
      delve = {
        build_flags = { "-tags=tests,mobile" },
      },
    },
  },
  {
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
              buildFlags = { "-tags=tests,mobile" },
              analyses = {
                unusedvariable = true,
                shadow = true,
              },
              templateExtensions = { "tmpl" },
            },
          },
        },
        golangci_lint_ls = {
          cmd = { "golangci-lint-langserver", "-debug" },
          init_options = {
            command = {
              "golangci-lint",
              "run",
              "--out-format",
              "json",
              "--issues-exit-code=1",
              "--config",
              os.getenv("HOME") .. "/.config/golangci-lint/.golang-ci.yaml",
            },
          },
          filetypes = { "go" },
        },
      },
    },
  },
}
