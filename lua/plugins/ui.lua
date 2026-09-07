local function nixie_hl()
  vim.api.nvim_set_hl(0, "NixieTitle", { fg = "#E09050", bold = true })
  vim.api.nvim_set_hl(0, "NixieGlass", { fg = "#7A3F24" })
  vim.api.nvim_set_hl(0, "NixieMesh", { fg = "#4A2818" })
  vim.api.nvim_set_hl(0, "NixieDigit", { fg = "#D87314", bold = true })
  vim.api.nvim_set_hl(0, "NixieDot", { fg = "#FFD27A", bold = true })
  vim.api.nvim_set_hl(0, "NixieMotto", { fg = "#C4844A", italic = true })
end

local function add(row, text, hl)
  row[#row + 1] = { text, hl = hl }
end

local function centered(text, hl, padding)
  return { text = { { text, hl = hl } }, align = "center", padding = padding }
end

local function item(row)
  return { text = row, align = "center" }
end

local GLYPH = {
  ["0"] = {
    " ### ",
    "#   #",
    "#   #",
    "#   #",
    " ### ",
  },
  ["1"] = {
    "  #  ",
    " ##  ",
    "  #  ",
    "  #  ",
    " ### ",
  },
  ["2"] = {
    "#### ",
    "    #",
    " ### ",
    "#    ",
    "#####",
  },
  ["3"] = {
    "#### ",
    "    #",
    " ### ",
    "    #",
    "#### ",
  },
  ["4"] = {
    "#   #",
    "#   #",
    "#####",
    "    #",
    "    #",
  },
  ["5"] = {
    "#####",
    "#    ",
    "#### ",
    "    #",
    "#### ",
  },
  ["6"] = {
    " ### ",
    "#    ",
    "#### ",
    "#   #",
    " ### ",
  },
  ["7"] = {
    "#####",
    "    #",
    "   # ",
    "  #  ",
    "  #  ",
  },
  ["8"] = {
    " ### ",
    "#   #",
    " ### ",
    "#   #",
    " ### ",
  },
  ["9"] = {
    " ### ",
    "#   #",
    " ####",
    "    #",
    " ### ",
  },
}

local DOT = {
  "     ",
  "     ",
  "     ",
  "  ## ",
  "  ## ",
}

local function paint(pattern, on_hl)
  local row = {}
  add(row, "│", "NixieGlass")
  for i = 1, #pattern do
    if pattern:sub(i, i) == "#" then
      add(row, "#", on_hl)
    else
      add(row, "░", "NixieMesh")
    end
  end
  add(row, "│", "NixieGlass")
  return row
end

local function tube_row(kind, cell)
  if kind == "cap" then
    return { { "╭─────╮", hl = "NixieGlass" } }
  end
  if kind == "base" then
    return { { "╰─────╯", hl = "NixieGlass" } }
  end
  local pattern
  local hl
  if cell.dot then
    pattern = DOT[kind]
    hl = "NixieDot"
  else
    pattern = GLYPH[cell.digit][kind]
    hl = "NixieDigit"
  end
  return paint(pattern, hl)
end

local function divergence_meter()
  local cells = { { digit = tostring(math.random(0, 1)) }, { dot = true } }
  local frac = string.format("%06d", math.random(0, 999999))
  for i = 1, 6 do
    cells[#cells + 1] = { digit = frac:sub(i, i) }
  end

  local rows = {
    align = "center",
    padding = 1,
    centered("--==<{  D I V E R G E N C E  }>==--", "NixieTitle"),
  }

  for _, kind in ipairs({ "cap", 1, 2, 3, 4, 5, "base" }) do
    local row = {}
    for i, cell in ipairs(cells) do
      for _, part in ipairs(tube_row(kind, cell)) do
        row[#row + 1] = part
      end
      if i < #cells then
        add(row, " ", "NixieMesh")
      end
    end
    rows[#rows + 1] = item(row)
  end

  rows[#rows + 1] = centered("~  E L   P S Y   K O N G R O O  ~", "NixieMotto", 1)
  return rows
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
      nixie_hl()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = nixie_hl })
    end,
    opts = {
      dashboard = {
        width = 72,
        sections = {
          divergence_meter,
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
