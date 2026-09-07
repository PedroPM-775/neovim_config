return {
  {
    "tpope/vim-rails",
    dependencies = { "tpope/vim-projectionist" },
    ft = { "ruby", "eruby", "yaml" },
  },
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>tn", "<cmd>TestNearest<cr>", desc = "Test nearest" },
      { "<leader>tf", "<cmd>TestFile<cr>", desc = "Test file" },
      { "<leader>tl", "<cmd>TestLast<cr>", desc = "Test last" },
      { "<leader>ts", "<cmd>TestSuite<cr>", desc = "Test suite" },
    },
    config = function()
      vim.g["test#custom_strategies"] = {
        snacks = function(cmd)
          Snacks.terminal.open(cmd, {
            win = { position = "float", border = "rounded", height = 0.8, width = 0.8 },
          })
        end,
      }
      vim.g["test#strategy"] = "snacks"
    end,
  },
}
