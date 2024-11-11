return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          enabled = true,
          settings = {
            basedpyright = {
              typeCheckingMode = "off",
            },
          },
        },
      },
    },
  },
}
