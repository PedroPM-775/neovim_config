local function map_lumen_gl()
  pcall(vim.keymap.del, "n", "<leader>gL")
  vim.keymap.set("n", "<leader>gL", function()
    require("lazy").load({ plugins = { "lumen.nvim" } })
    require("lumen").pick_diff()
  end, { desc = "Lumen diff (pick branches)" })
end

return {
  "PedroPM-775/lumen.nvim",
  dependencies = {
    "folke/snacks.nvim",
  },
  opts = {
    base = "develop",
    head = "HEAD",
    use_triple_dot = true,
    keymap = false,
  },
  cmd = { "Lumen", "LumenPick" },
  init = function()
    -- LazyVim loads keymaps on VeryLazy and binds gL to git_log after us
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimKeymaps",
      callback = map_lumen_gl,
    })
  end,
  config = function(_, opts)
    require("lumen").setup(opts)
    map_lumen_gl()
  end,
}