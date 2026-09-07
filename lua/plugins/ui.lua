local function dashboard_header()
  math.randomseed(os.time())
  local n = string.format("%d.%06d", math.random(0, 1), math.random(0, 999999))
  local d = {}
  for i = 1, #n do
    d[i] = n:sub(i, i)
  end
  return [[
 .---. .---. .---. .---. .---. .---. .---. .---.
 | ]] .. d[1] .. [[ | | ]] .. d[2] .. [[ | | ]] .. d[3] .. [[ | | ]] .. d[4] .. [[ | | ]] .. d[5] .. [[ | | ]] .. d[6] .. [[ | | ]] .. d[7] .. [[ | | ]] .. d[8] .. [[ |
 '---' '---' '---' '---' '---' '---' '---' '---'
 [===============================================]
 - E L  P S Y  K O N G R O O -
  ]]
end

local function dashboard_hl()
  vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#FFA066", bold = true })
end

return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = "wave",
      overrides = function(colors)
        local ui = colors.theme.ui
        return {
          WinSeparator = { fg = "#ffffff", bg = "none" },
          VertSplit = { fg = "#ffffff", bg = "none" },
          StatusLine = { fg = ui.fg_base, bg = ui.bg_p1 },
          StatusLineNC = { fg = ui.bg_p1, bg = "none" },
          FloatBorder = { fg = ui.bg_p1, bg = "none" },
          NormalFloat = { bg = "none" },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "kanagawa" },
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {
      extra_groups = { "NormalFloat" },
    },
  },
  {
    "folke/snacks.nvim",
    init = function()
      dashboard_hl()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = dashboard_hl })
    end,
    opts = {
      dashboard = {
        preset = { header = dashboard_header() },
        sections = {
          { section = "header", hl = "SnacksDashboardHeader" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
