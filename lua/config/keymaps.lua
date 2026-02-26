vim.keymap.set("n", "<leader>h", function() Snacks.dashboard.open() end, { desc = "Ir al Dashboard" })
vim.keymap.set("n", "<leader>fs", function() require("snacks").picker.grep_word() end, { desc = "Buscar palabra bajo el cursor (Search)" })

vim.keymap.set("n", "<leader>ff", function() require("snacks").picker.files() end, { desc = "Buscar archivos" })
