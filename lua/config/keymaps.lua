vim.keymap.set("n", "<leader>ñ", function()
  Snacks.dashboard.open()
end, { desc = "Dashboard" })

vim.keymap.set("n", "<leader>e", function()
  Snacks.explorer.open()
end, { desc = "Explorer" })

vim.keymap.set("n", "<leader>mñ", function()
  Snacks.picker.files({ ignored = true })
end, { desc = "Files (ignored)" })

vim.keymap.set("n", "gt", function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1
  local path

  for p1, _, filepath, _, p2 in line:gmatch("()([\"'])(.-)(%2)()") do
    if col >= tonumber(p1) and col <= tonumber(p2) then
      path = filepath
      break
    end
  end

  if path and path ~= "" then
    Snacks.picker.files({ pattern = path, title = path })
  else
    local ok = pcall(vim.cmd, "normal! gf")
    if not ok then
      vim.notify("No se encontró una ruta válida", vim.log.levels.WARN)
    end
  end
end, { desc = "Go to file in quotes" })

local rails = {
  m = { "app/models", "Models" },
  c = { "app/controllers", "Controllers" },
  v = { "app/views", "Views" },
  p = { "app/policies", "Policies" },
}

for key, spec in pairs(rails) do
  vim.keymap.set("n", "<leader>r" .. key, function()
    Snacks.picker.files({ dirs = { spec[1] }, title = spec[2] })
  end, { desc = "Rails " .. spec[2] })
end

vim.keymap.set("n", "<leader>ra", "<cmd>A<cr>", { desc = "Rails alternate" })
vim.keymap.set("n", "<leader>rr", "<cmd>R<cr>", { desc = "Rails related" })
vim.keymap.set("n", "<leader>a", "gf", { remap = true, desc = "Goto file" })
vim.keymap.set("n", "<leader>fs", function()
  Snacks.picker.grep({ search = 'create_table "', glob = "db/schema.rb" })
end, { desc = "Schema table" })

-- Spanish layout: Ctrl+/ is the 7 key. Kitty reports it as <C-7>, not <C-/>.
vim.keymap.set({ "n", "t" }, "<C-7>", function()
  Snacks.terminal.focus(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

Snacks.toggle.option("laststatus", {
  off = 0,
  on = vim.o.laststatus > 0 and vim.o.laststatus or 3,
  global = true,
  name = "Statusline",
}):map("<leader>uB")
