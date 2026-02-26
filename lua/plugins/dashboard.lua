-- Esta es la parte mágica que sobrevive al reinicio
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#FFA066", bold = true })
    vim.api.nvim_set_hl(0, "NixieOrange", { fg = "#FFA066", bold = true })
  end,
})

local function get_divergence_header()
  math.randomseed(os.time())
  local random_divergence = string.format("%d.%06d", math.random(0, 1), math.random(0, 999999))
  
  local d = {}
  for i = 1, #random_divergence do
    d[i] = random_divergence:sub(i, i)
  end

  return [[
 .---. .---. .---. .---. .---. .---. .---. .---.
 | ]]..d[1]..[[ | | ]]..d[2]..[[ | | ]]..d[3]..[[ | | ]]..d[4]..[[ | | ]]..d[5]..[[ | | ]]..d[6]..[[ | | ]]..d[7]..[[ | | ]]..d[8]..[[ |
 '---' '---' '---' '---' '---' '---' '---' '---'
 [===============================================]
 - E L  P S Y  K O N G R O O -
  ]]
end

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = get_divergence_header(),
      },
      sections = {
        { section = "header", hl = "SnacksDashboardHeader" }, 
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
