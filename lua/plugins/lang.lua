local function without(list, name)
  return vim.tbl_filter(function(item)
    return item ~= name
  end, list or {})
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "ruby", "embedded_template", "css" },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = {}
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs({ "markdown", "markdown.mdx" }) do
        opts.formatters_by_ft[ft] = without(opts.formatters_by_ft[ft], "markdownlint-cli2")
      end
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = without(opts.ensure_installed, "markdownlint-cli2")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = { enabled = false },
        intelephense = { enabled = false },
        vtsls = { enabled = false },
        ts_ls = { enabled = false },
        eslint = { enabled = false },
        tailwindcss = { enabled = false },
      },
    },
  },
}
