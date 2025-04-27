return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").rust_analyzer.setup({
        handlers = {
          ["textDocument/signatureHelp"] = function() end,
        },
        settings = {
            ["rust-analyzer"] = {
              cargo = {
              allFeatures = false,
            },
            checkOnSave = {
             command = "clippy",
            },
            procMacro = {
              enable = false,
            },
          },
        },
        on_attach = function(_, bufnr)
          local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true })
          end
          map("n", "gd", vim.lsp.buf.definition)
          map("n", "K", vim.lsp.buf.hover)
        end,
      })
    end,
  },
}

