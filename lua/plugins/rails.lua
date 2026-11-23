local rails_ft = { "ruby", "eruby", "eruby.html", "yaml", "eruby.yaml" }

-- lazy.nvim's `keys` + `ft` installs an <expr> placeholder until the plugin
-- loads. A sequence ending in `v` then falls through into visual mode, so
-- <leader>rev never reaches :Eview. Map the real command from config instead.
local edits = {
  { "m", "Emodel", "Model" },
  { "c", "Econtroller", "Controller" },
  { "v", "Eview", "View" },
  { "h", "Ehelper", "Helper" },
  { "s", "Eschema", "Schema" },
  { "i", "Emigration", "Migration" },
  { "l", "Emailer", "Mailer" },
  { "p", "Epolicy", "Policy" },
  { "r", "Einitializer", "Routes" },
}

local function map_rails_edits(buf)
  for _, spec in ipairs(edits) do
    local key, command, desc = spec[1], spec[2], spec[3]
    vim.keymap.set("n", "<leader>re" .. key, function()
      -- schedule so which-key has released the keys before the prompt opens
      vim.schedule(function()
        vim.fn.feedkeys(":" .. command .. " ", "n")
      end)
    end, { buffer = buf, desc = desc, silent = true, nowait = true })
  end
end

return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>r", group = "rails" },
        { "<leader>re", group = "edit" },
      },
    },
  },
  {
    "tpope/vim-rails",
    dependencies = { "tpope/vim-projectionist" },
    ft = rails_ft,
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = rails_ft,
        callback = function(event)
          map_rails_edits(event.buf)
        end,
      })
      local buf = vim.api.nvim_get_current_buf()
      if vim.tbl_contains(rails_ft, vim.bo[buf].filetype) then
        map_rails_edits(buf)
      end
    end,
  },
}
