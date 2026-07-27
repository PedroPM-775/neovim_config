vim.keymap.set("n", "<leader>ñ", function() Snacks.dashboard.open() end, { desc = "Ir al Dashboard" })
vim.keymap.set("n", "<leader>e", function()
  Snacks.explorer.open({ layout = { layout = { position = "right" } } })
end, { desc = "Explorer Snacks (Derecha)" })
-- Jump to whatever is inside the quotes under the cursor
vim.keymap.set("n", "gt", function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1
  local path = nil
  for p1, c, p2 in line:gmatch("()([\"'])(.-)%2()") do
    if col >= p1 and col <= p2 then
      path = c
      break
    end
  end

  if path and path ~= "" then
    Snacks.picker.files({
      pattern = path,
      title = "Jumping to: " .. path,
    })
  else
    local ok, _ = pcall(vim.cmd, "normal! gf")
    if not ok then
      vim.notify("No se encontró una ruta válida", vim.log.levels.WARN)
    end
  end
end, { desc = "Go to File in Quotes" })
vim.keymap.set("n", "<leader>mñ", function()
  Snacks.picker.files({ ignored = true })
end, { desc = "Buscar archivos (incluidos ocultos)" })
-- ============================================================================
-- Navegación súper rápida por Rails con Snacks.picker
-- ============================================================================

-- Navegar por modelos, controladores y vistas buscando con Snacks
vim.keymap.set("n", "<leader>rm", function()
  Snacks.picker.files({ dirs = { "app/models" }, title = "Modelos Rails" })
end, { desc = "Rails: Buscar Modelos" })

vim.keymap.set("n", "<leader>rc", function()
  Snacks.picker.files({ dirs = { "app/controllers" }, title = "Controladores Rails" })
end, { desc = "Rails: Buscar Controladores" })

vim.keymap.set("n", "<leader>rv", function()
  Snacks.picker.files({ dirs = { "app/views" }, title = "Vistas Rails" })
end, { desc = "Rails: Buscar Vistas" })

vim.keymap.set("n", "<leader>rs", function()
  Snacks.picker.files({ dirs = { "spec", "test" }, title = "Specs / Tests" })
end, { desc = "Rails: Buscar Tests" })

vim.keymap.set("n", "<leader>rp", function()
  Snacks.picker.files({ dirs = { "app/policies" }, title = "Policies" })
end, { desc = "Rails: Buscar Policies" })

-- Los saltos contextuales inmediatos (estos SÍ funcionan solos si estás en un archivo de Rails)
vim.keymap.set("n", "<leader>ra", "<cmd>A<cr>", { desc = "Rails: Salta a test/spec alternativo (:A)" })
vim.keymap.set("n", "<leader>rr", "<cmd>R<cr>", { desc = "Rails: Salta a archivo relacionado (:R)" })
-- Buscar directamente en el schema.rb con Snacks
vim.keymap.set("n", "<leader>fs", function()
  Snacks.picker.grep({
    search = "create_table",
    buffers = false,
    files = { "db/schema.rb" },
  })
end, { desc = "Buscar tabla en db/schema.rb" })
