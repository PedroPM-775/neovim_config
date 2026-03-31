vim.keymap.set("n", "<leader>ñ", function() Snacks.dashboard.open() end, { desc = "Ir al Dashboard" })
vim.keymap.set("n", "<leader>e", function()
  Snacks.explorer.open({ layout = { layout = { position = "right" } } })
end, { desc = "Explorer Snacks (Derecha)" })
-- Jump to whatever is inside the quotes under the cursor
vim.keymap.set("n", "gt", function()
  -- 1. Get the current line
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1

  -- 2. Find the start and end of the quotes around the cursor
  local s = line:find("['\"]", 1)
  local start_quote, end_quote, path
  
  while s do
    local e = line:find("['\"]", s + 1)
    if e and s < col and col <= e then
      path = line:sub(s + 1, e - 1)
      break
    end
    s = line:find("['\"]", e and e + 1 or nil)
  end

  -- 3. If we found a path, tell Snacks to find that file
  if path and path ~= "" then
    Snacks.picker.files({
      pattern = path,
      title = "Jumping to: " .. path,
    })
  else
    -- Fallback to default gf behavior if not in quotes
    vim.cmd("normal! gf")
  end
end, { desc = "Go to File in Quotes" })
