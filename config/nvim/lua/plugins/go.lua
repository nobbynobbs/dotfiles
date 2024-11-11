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
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      opts = {
        delve = {
          build_flags = "-tags=tests,mobile,web",
        },
      },
    },
    opts = function()
      local dap = require("dap")
      local dotenv = require("dotenv")
      local env = dotenv.readEnv("build/local/.env")

      dap.configurations.go = {
        {
          type = "go",
          name = ".env",
          program = "${file}",
          request = "launch",
          env = env,
        },
      }
    end,
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
              buildFlags = { "-tags=tests,mobile,web" },
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
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-golang"] = {
          -- Here we can set options for neotest-golang, e.g.
          go_test_args = { "-v", "-race", "-count=1", "-timeout=60s", "-tags=tests,mobile,web" },
          dap_go_enabled = true,
          dap_go_opts = {
            delve = {
              build_flags = "-tags=tests,mobile,web",
            },
          },
        },
      },
    },
  },
}
