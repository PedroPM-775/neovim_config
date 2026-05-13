vim.keymap.set("n", "<leader>ñ", function() Snacks.dashboard.open() end, { desc = "Ir al Dashboard" })
vim.keymap.set("n", "<leader>e", function()
  Snacks.explorer.open({ layout = { layout = { position = "right" } } })
end, { desc = "Explorer Snacks (Derecha)" })
-- Jump to whatever is inside the quotes under the cursor
vim.keymap.set("n", "gt", function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1
  local path = nil
  for p1, q, c, p2 in line:gmatch("()([\"'])(.-)%2()") do
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

vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>")
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>")
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>")
vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>")
