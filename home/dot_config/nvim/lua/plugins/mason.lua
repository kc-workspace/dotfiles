return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "tree-sitter-cli",
        "ast-grep",
        "lua-language-server",
        "stylua",
        "bash-language-server",
        "shellcheck",
        "shfmt",
        "typescript-language-server",
        "gopls",
      },
    },
  },
}
