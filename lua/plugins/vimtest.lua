return {
  "vim-test/vim-test",
  dependencies = {
    "folke/snacks.nvim",
  },
  keys = {
    { "<leader>tn", "<cmd>TestNearest<cr>", desc = "Test: Ejecutar test más cercano" },
    { "<leader>tf", "<cmd>TestFile<cr>",    desc = "Test: Ejecutar todo el archivo actual" },
    { "<leader>tl", "<cmd>TestLast<cr>",    desc = "Test: Repetir último test" },
    { "<leader>ts", "<cmd>TestSuite<cr>",   desc = "Test: Ejecutar toda la suite" },
  },
  config = function()
    -- Estrategia personalizada usando la terminal flotante de Snacks
    vim.g["test#custom_strategies"] = {
      snacks = function(cmd)
        Snacks.terminal.open(cmd, {
          win = {
            position = "float",
            border = "rounded",
            height = 0.8,
            width = 0.8,
          },
        })
      end,
    }

    -- Asignamos Snacks como la estrategia por defecto para vim-test
    vim.g["test#strategy"] = "snacks"

    -- Si usas Docker / Spring / Bundle, puedes personalizar cómo se ejecuta
    -- Por defecto, vim-test detecta automáticamente si usas `bundle exec rspec` o `rails test`
  end,
}
