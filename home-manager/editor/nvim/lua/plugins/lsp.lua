return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").rust_analyzer.setup({
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

